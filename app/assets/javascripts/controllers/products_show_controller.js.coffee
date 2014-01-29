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
        order.save().then(()->
            SiloStore.FlashQueue.pushFlash('notice', self.get('content').get('name')+' added to Cart.')
            self.transitionToRoute 'checkout.cart'
        ,()->
            alert 'save failed'
        )
      else
        lineItem = @store.createRecord('lineItem')
        lineItem.set('variantId', variantId)
        lineItem.set('quantity', quantity)
        lineItems.pushObject(lineItem)
        order.save().then(()->
            # Shouldn't have to do this... but I think it's due to nested attributes and rails not sending a 201 created for each...
            self.store.deleteRecord(lineItem)
            SiloStore.FlashQueue.pushFlash('notice', self.get('content').get('name')+' added to Cart.')
            self.transitionToRoute 'checkout.cart'
        ,()->
            alert 'save failed'
        )
  }
