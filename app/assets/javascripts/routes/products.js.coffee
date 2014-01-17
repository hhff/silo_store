SiloStore.ProductsShowRoute = Ember.Route.extend
  model: (params) ->
    @store.find('product', params.product_id).then((product)->
      product:product
    )

  setupController: (controller, model)->
    controller.set('content', model)
    controller.set('order', @store.find('order', 'current'));