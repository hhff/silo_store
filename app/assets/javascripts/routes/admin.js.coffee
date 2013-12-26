SiloStore.AdminRoute = Ember.Route.extend

  enter: ->
    if !@controllerFor('admin').get('isSignedIn')
      @transitionTo 'sessions.new'