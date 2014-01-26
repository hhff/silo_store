SiloStore.ProductsRoute = Ember.Route.extend
  model: ->
    @store.find('order', 'current').then((order)->
      order:order
    )

  setupController: (controller, model)->
    controller.set('content', model)

SiloStore.ProductsShowRoute = Ember.Route.extend
  model: (params) ->
    @store.find('product', params.product_id)

  setupController: (controller, model)->
    controller.set('content', model)
    controller.set('order', @store.find('order', 'current'));