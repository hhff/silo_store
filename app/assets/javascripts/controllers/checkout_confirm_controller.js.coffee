SiloStore.CheckoutConfirmController = Ember.ObjectController.extend

  needs: ['checkout']

  isLoading: false

  attemptingComplete: false

  actions: {
    setLoading: (boolean)->
      @set('isLoading', boolean)
      @get('controllers.checkout').set('isLoading', boolean)

    saveAndContinue: ->
      self = @

      @send('setLoading', true)

      @get('content').set('state', 'complete')
      @get('content').set('completed_at', new Date())

      @get('content').save().then(()->
        self.set('attemptingComplete', true)
        SiloStore.FlashQueue.pushFlash('notice', 'Thanks for your order!');
        self.send('setLoading', false)
        self.get('controllers.checkout').send('advance')
      ,()->
        self.set('attemptingComplete', false)
        self.send('setLoading', false)
        SiloStore.FlashQueue.pushFlash('error', 'Oops, something went wrong!');
      )

    back: ->
      @get('controllers.checkout').send('back')
  }