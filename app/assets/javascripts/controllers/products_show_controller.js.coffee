SiloStore.ProductsShowController = Ember.ObjectController.extend

  actions:{
    addToCart: ->
      alert 'add2cart'

      $.ajax '/spree/api/orders/R802783585/line_items?line_item[variant_id]=1&line_item[quantity]=1',
        type: 'POST'
        success: (data) ->
          alert 'success!'
          console.log data
  }