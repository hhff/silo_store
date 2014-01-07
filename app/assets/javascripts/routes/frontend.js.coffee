SiloStore.FrontendRoute = Ember.Route.extend

    model: -> @store.findAll('product').then((products)->
      products: products
    )