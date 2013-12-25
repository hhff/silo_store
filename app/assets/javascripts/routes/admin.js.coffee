SiloStore.AdminRoute = Ember.Route.extend

  beforeModel: ->
    if !@controllerFor('admin').get('isSignedIn')
      @transitionTo 'sessions.new'