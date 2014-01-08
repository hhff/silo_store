SiloStore.ProductsShowController = Ember.ObjectController.extend

  needs: ['cart']

  actions:{
    addToCart: ->
      @get('controllers.cart').send('addVariantToCurrentOrder', 1, 1)
  }