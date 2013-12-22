SiloStore.CurrentUserController = Ember.ObjectController.extend
  isSignedIn: (->
    @get('content') && @get('content').get('isLoaded')
  ).property('content.isLoaded')
