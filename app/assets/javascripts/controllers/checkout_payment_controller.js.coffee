SiloStore.CheckoutPaymentController = Ember.ObjectController.extend

  needs: ['checkout']

  isLoading: false

  actions: {
    setupPaymentSource: (stripeResponse)->

      # This part is essential...
      mapCC = (ccType) ->
        if (ccType == 'MasterCard') 
          'mastercard'
        else if (ccType == 'Visa') 
          'visa'
        else if (ccType == 'American Express')
          'amex'
        else if (ccType == 'Discover')
          'discover'
        else if (ccType == 'Diners Club')
          'dinersclub'
        else if (ccType == 'JCB')
          'jcb'

      payment = @get('content').get('payments').get('firstObject')
      if !payment.get('source')
        source = @store.createRecord 'source', {
          month: stripeResponse.card.exp_month
          year: stripeResponse.card.exp_year
          cc_type: mapCC(stripeResponse.card.type)
          last_digits: stripeResponse.card.last4
          gateway_payment_profile_id: stripeResponse.id
        }
      
        payment.set('source', source)

      else
        # Payment source exists but needs to be updated...

      @send('saveAndContinue')

    saveAndContinue: ->
      self = @

      @get('content').set('state', 'confirm')
      @get('content').save().then(()->
        self.set('isLoading', false)
        self.get('controllers.checkout').send('advance')
      ,()->
        self.set('isLoading', false)
        alert 'save error'
      )

    back: ->
      @get('controllers.checkout').send('back')
  }