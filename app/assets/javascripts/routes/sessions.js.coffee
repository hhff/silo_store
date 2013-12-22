SiloStore.SessionsNewRoute = Ember.Route.extend
  model: -> SiloStore.Session.createRecord()

  setupController: (controller, model) ->
    controller.set('content', model)

SiloStore.SessionsDestroyRoute = Ember.Route.extend
  enter: ->
    controller = @controllerFor('currentUser')
    controller.set('content', undefined)

    SiloStore.Session.find('current').then((session)->
      # session.deleteRecord()
      # controller.store.commit()
      console.log 'find aint there'
    )