SiloStore.SessionsNewRoute = Ember.Route.extend
  model: -> SiloStore.Session.createRecord()

  setupController: (controller, model) ->
    controller.set('content', model)