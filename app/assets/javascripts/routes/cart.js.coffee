SiloStore.CartRoute = Ember.Route.extend

  model: ->
    @store.find('order', 'current').then((order)->
      order:order,
      lineItems: order.get 'lineItem'
    )

  setupController: (controller, model)->
    controller.set('content', model)


  # afterModel: (order, transition)->
  #   order.get 'lineItems'
