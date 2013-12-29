SiloStore.AdminController = Ember.ObjectController.extend

  currentPage: 'null'

  isSignedIn: (->
    @get('content') != null
  ).property('content')