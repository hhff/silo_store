SiloStore.AdminController = Ember.ObjectController.extend

  currentPage: 'null'

  isSignedIn: (->
    @get('content') && @get('content').get('isLoaded')
  ).property('content.isLoaded')
