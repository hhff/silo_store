SiloStore.UsersNewRoute = Ember.Route.extend
  model: -> SiloStore.User.createRecord()

  setupController: (controller, model)->
    controller.set('content', model)