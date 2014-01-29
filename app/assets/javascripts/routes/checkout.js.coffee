# CHECKOUT PARENT ROUTE
SiloStore.CheckoutRoute = Ember.Route.extend
  model: -> @store.find('order', 'current').then((order)->
    order:order
  )

  setupController: (controller, model)->
    controller.set('content', model)

# CART ROUTE
SiloStore.CheckoutCartRoute = Ember.Route.extend
  enter: -> @controllerFor('checkout').send('canEnter', 'cart')
  model: -> @store.find('order', 'current')

  setupController: (controller, model)->
    controller.set('content', model)

# ADDRESS ROUTE
SiloStore.CheckoutAddressRoute = Ember.Route.extend
  enter: -> @controllerFor('checkout').send('canEnter', 'address')

  model: -> @store.find('order', 'current')

  setupController: (controller, model)->
    controller.set('content', model)

    order = model
    if !order.get('ship_address')
      ship = @store.createRecord 'shipAddress'
      order.set('ship_address', ship)

# PAYMENT ROUTE
SiloStore.CheckoutPaymentRoute = Ember.Route.extend

  enter: -> @controllerFor('checkout').send('canEnter', 'payment')

  model: -> @store.find('order', 'current')

  setupController: (controller, model)->
    controller.set('content', model)

# CONFIRM ROUTE
SiloStore.CheckoutConfirmRoute = Ember.Route.extend
  enter: ->  @controllerFor('checkout').send('canEnter', 'confirm')

  model: -> @store.find('order', 'current')

  setupController: (controller, model)->
    controller.set('content', model)

  # deactivate: ()->
  #   self = @
  #   controller = @get('controller')
  #   order = @get('currentModel')

    # We could wipe the payment details here for security
    # if controller.get('attemptingComplete') == false
    #   order.get('payments').forEach((payment)->
    #     self.store.deleteRecord(payment)
    #   )



# THANKYOU ROUTE
SiloStore.CheckoutThankyouRoute = Ember.Route.extend
  enter: -> @controllerFor('checkout').send('canEnter', 'thankyou')

  model: -> @store.find('order', 'current')

  setupController: (controller, model)->
    controller.set('content', model)

  deactivate: ->
    @transitionTo('checkout.cart').then(->
      SiloStore.reset()
    )
