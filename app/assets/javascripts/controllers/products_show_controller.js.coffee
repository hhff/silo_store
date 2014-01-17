SiloStore.ProductsShowController = Ember.ObjectController.extend

  actions:{
    addToCart: (variantId, quantity)->

      quantity = 1
      variantId = 1

      order = @get('order')
      lineItems = order.get('line_items')
      lineItem = lineItems.findBy('variantId', variantId)

      if lineItem
        currentQuantity = lineItem.get('quantity')
        lineItem.set('quantity', currentQuantity+1)
        lineItem.save().then(
          @transitionToRoute 'cart'          
        )
      else
        lineItem = @store.createRecord('lineItem')
        lineItem.set('variantId', variantId)
        lineItem.set('quantity', quantity)
        lineItem.save().then(->
          order.get('line_items').pushObject(lineItem)
          @transitionToRoute 'cart'
        )

      # @get('controllers.cart').send('addVariantToCurrentOrder', 1, 1)
  }