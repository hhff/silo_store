SiloStore.CheckoutCartController = Ember.ObjectController.extend

  needs: ['checkout']

  actions: {
    saveIfDirtyAndContinue: ->
      self = @
      if @get('content').get('isDirty')
        @get('content').save().then(()->
          self.get('controllers.checkout').send('advance')
        , ()->
          alert 'order update failed'
        )
      else
        @get('controllers.checkout').send('advance')

    delete: (lineItem)->
      self = @
      lineItem.set('_destroy', true)
      @get('content').save().then(()->
        # succesful delete
        self.store.deleteRecord(lineItem)
      , ()->
        alert 'delete failed'
      )
  }