SiloStore.CartRoute = Ember.Route.extend

  model: ->
    @store.find('order', 'current').then((order)->
      order:order,
      lineItems: order.get 'lineItem'
    )


  # afterModel: (order, transition)->
  #   order.get 'lineItems'
