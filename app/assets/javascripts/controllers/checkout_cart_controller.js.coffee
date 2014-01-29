SiloStore.CheckoutCartController = Ember.ObjectController.extend

  needs: ['checkout']

  isLoading: false

  actions: {
    setLoading: (boolean)->
      @set('isLoading', boolean)
      @get('controllers.checkout').set('isLoading', boolean)

    saveIfDirtyAndContinue: ->
      self = @
      if @get('content').get('isDirty')
        self.send('setLoading', true)

        @get('content').save().then(()->
          SiloStore.FlashQueue.pushFlash('notice', 'Cart Updated!');
          self.send('setLoading', false)
          self.get('controllers.checkout').send('advance')
        , ()->
          self.send('setLoading', false)
          SiloStore.FlashQueue.pushFlash('error', 'Ooops! Please try again.');
        )
      else
        @get('controllers.checkout').send('advance')

    delete: (lineItem)->
      self = @
      lineItem.set('_destroy', true)
      name = lineItem.get('product').get('name')
      @get('content').save().then(()->
        SiloStore.FlashQueue.pushFlash('notice', name+' was removed from your cart.');
        self.store.deleteRecord(lineItem)
      , ()->
        SiloStore.FlashQueue.pushFlash('error', 'Ooops! Please try again.');
      )
  }

