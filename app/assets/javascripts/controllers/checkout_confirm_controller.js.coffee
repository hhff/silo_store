SiloStore.CheckoutConfirmController = Ember.ObjectController.extend

  needs: ['checkout']

  isLoading: false

  actions: {
    saveAndContinue: ->
      self = @

      @set('isLoading', true)

      @get('content').set('state', 'complete')
      @get('content').set('completed_at', new Date())

      @get('content').save().then(()->
        self.set('isLoading', false)
        self.get('controllers.checkout').send('advance')
      ,()->
        alert 'save error'
      )
  }