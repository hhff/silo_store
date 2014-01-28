SiloStore.CheckoutCartController = Ember.ObjectController.extend

  needs: ['checkout']

  actions: {
    saveIfDirtyAndContinue: ->
      if @get('content').get('isDirty')
        # True - is dirty and needs to save here
      else
        # false - continue on without save
        @get('controllers.checkout').send('advance')

  }