SiloStore.AdminRoute = Ember.Route.extend

  enter: ->
    if @controllerFor('admin').get('isSignedIn') == null
      @transitionTo 'sessions.new'

#   # model: -> SiloStore.User.find 'current'

#   # setupController: (controller, model)->
#   #   controller.set('content', model)


#   actions: {
#     error: (error, transition)->
#       console.log error
#       # @transitionTo 'sessions.new'
#   }