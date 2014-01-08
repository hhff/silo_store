SiloStore.CartController = Ember.ObjectController.extend


  actions: {
    addVariantToCurrentOrder: (variant, quantity)->
      orderNumber = @get 'number'
      orderToken = @get 'token'
      self = @

      $.ajax '/api/v1/line_items?line_item[variant_id]='+variant+'&line_item[quantity]='+quantity+'&order_token='+orderToken,
        type: 'POST'
        success: (data) ->
          console.log 'success!'
          self.set('content', data)
        error: (data) ->
          alert 'failure!'
        complete: ->
          self.transitionToRoute 'cart'

  }