SiloStore.CheckoutConfirmController = Ember.ObjectController.extend

  actions: {
    saveAndContinue: ->
      self = @
      # Needs Logic incase payment not required.. etc
      # Perhaps abstract out state machine somehow...?
      @get('content').set('state', 'complete')
      @get('content').set('completed_at', new Date())

      @get('content').save().then(()->
        self.transitionToRoute('frontend')
      )
  }