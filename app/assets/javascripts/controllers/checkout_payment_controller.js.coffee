SiloStore.CheckoutPaymentController = Ember.ObjectController.extend

  needs: ['checkout']

  isLoading: false

  actions: {
    setLoading: (boolean)->
      @set('isLoading', boolean)
      @get('controllers.checkout').set('isLoading', boolean)

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

      order = @get 'content'

      if order.get('payments').get('length') < 1
        payment = @store.createRecord 'payment', {
          amount: order.get 'item_total'
          # Change this when using multiple payment methods
          payment_method_id: 1
        }
        source = @store.createRecord 'source', {
          month: stripeResponse.card.exp_month
          year: stripeResponse.card.exp_year
          cc_type: mapCC(stripeResponse.card.type)
          last_digits: stripeResponse.card.last4
          gateway_payment_profile_id: stripeResponse.id
        }

        payment.set('source', source)
        order.get('payments').pushObject(payment)
        SiloStore.FlashQueue.pushFlash('notice', 'Credit Card Approved.');

      else
        payment = order.get('payments').get('lastObject')
        payment.set('amount', order.get 'item_total')
        # Change this when using multiple payment methods
        payment.set('payment_method_id', 1)
        source = payment.get('source')
        source.set('month', stripeResponse.card.exp_month)
        source.set('year', stripeResponse.card.exp_year)
        source.set('cc_type', mapCC(stripeResponse.card.type))
        source.set('last_digits', stripeResponse.card.last4)
        source.set('gateway_payment_profile_id', stripeResponse.id)

        SiloStore.FlashQueue.pushFlash('notice', 'Credit Card Updated.');

      @send('saveAndContinue')

    saveAndContinue: ->
      self = @

      # Need to perform validation here!

      @get('content').set('state', 'confirm')
      @send('setLoading', false)
      @get('controllers.checkout').send('advance')

      # @get('content').save().then(()->
      #   self.send('setLoading', false)
      #   self.get('controllers.checkout').send('advance')
      # ,()->
      #   self.send('setLoading', false)
      #   alert 'save error'
      # )

    back: ->
      @get('controllers.checkout').send('back')
  }