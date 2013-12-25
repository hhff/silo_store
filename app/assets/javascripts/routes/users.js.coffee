SiloStore.UsersNewRoute = Ember.Route.extend
  model: -> @store.createRecord('User')

  setupController: (controller, model)->
    controller.set('content', model)