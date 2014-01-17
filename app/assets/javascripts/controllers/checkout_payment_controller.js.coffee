SiloStore.CheckoutPaymentController = Ember.ObjectController.extend

  actions: {
    setupPaymentSource: (stripeResponse)->

      payment = @get('content').get('payments').get('firstObject')
      if !payment.get('source')
        source = @store.createRecord 'source', {
          month: stripeResponse.card.exp_month
          year: stripeResponse.card.exp_year
          cc_type: stripeResponse.card.type
          last_digits: stripeResponse.card.last4
          gateway_payment_profile_id: stripeResponse.id
        }
      
        payment.set('source', source)

      else
        # Payment source exists but needs to be updated...

      @send('saveAndContinue')


    saveAndContinue: ->
      @get('content').save()
      console.log 'saved...'
      # @transitionToRoute('frontend')
  }