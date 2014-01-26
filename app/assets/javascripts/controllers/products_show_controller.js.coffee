SiloStore.ProductsShowController = Ember.ObjectController.extend

  actions:{
    addToCart: (variantId, quantity)->

      quantity = 1
      variantId = 1

      self = @

      order = @get('order').get('content')

      lineItems = order.get('line_items')
      lineItem = lineItems.findBy('variantId', variantId)

      if lineItem
        currentQuantity = lineItem.get('quantity')
        lineItem.set('quantity', currentQuantity+1)
        order.save().then(
          alert 'update line item'
          self.transitionToRoute 'checkout.cart'          
        )
      else
        lineItem = @store.createRecord('lineItem')
        lineItem.set('variantId', variantId)
        lineItem.set('quantity', quantity)
        lineItems.pushObject(lineItem)
        order.save().then(->
          alert 'create line item'
          self.transitionToRoute 'checkout.cart'
        )
  }