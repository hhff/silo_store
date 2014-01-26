SiloStore.FrontendRoute = Ember.Route.extend

  model: ->
    Ember.RSVP.hash({
      order: @store.find('order', 'current'),
      products: @store.find('product')
    })

  setupControler: (model, controller) ->
    controller.set('content', model)

