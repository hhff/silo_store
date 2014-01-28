SiloStore.CartQuantityComponent = Ember.Component.extend

  actions: {
    increaseQuantity: ->
      order = @get('line_item').get('order')
      @incrementProperty 'line_item.quantity'
      order.send('becomeDirty')
      order.notifyPropertyChange('line_items')

    decreaseQuantity: ->
      order = @get('line_item').get('order')
      if @get('line_item').get('quantity') > '1'
        @decrementProperty 'line_item.quantity'
        order.send('becomeDirty')
        order.notifyPropertyChange('line_items')
  }