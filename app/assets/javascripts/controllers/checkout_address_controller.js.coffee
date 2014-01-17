SiloStore.CheckoutAddressController = Ember.ObjectController.extend

  actions: {
    saveAndContinue: ->
      self = @
      # Needs Logic incase payment not required.. etc
      # Perhaps abstract out state machine somehow...?
      @get('content').set('state', 'payment')

      @get('content').save().then(()->
        self.transitionToRoute('checkout.payment')
      )
  }