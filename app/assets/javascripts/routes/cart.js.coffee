SiloStore.CartRoute = Ember.Route.extend

  model: ->
    @store.find('order', 'current')

  setupController: (controller, model)->
    controller.set('content', model)