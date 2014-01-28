# CHECKOUT PARENT ROUTE
SiloStore.CheckoutRoute = Ember.Route.extend
  model: -> @store.find('order', 'current').then((order)->
    order:order
  )

  setupController: (controller, model)->
    controller.set('content', model)

# CART ROUTE
SiloStore.CheckoutCartRoute = Ember.Route.extend
  model: ->
    @store.find('order', 'current')

  setupController: (controller, model)->
    controller.set('content', model)

  enter: -> @controllerFor('checkout').set('checkoutState', 'cart')

# ADDRESS ROUTE
SiloStore.CheckoutAddressRoute = Ember.Route.extend
  model: -> @store.find('order', 'current')

  setupController: (controller, model)->
    controller.set('content', model)

    order = model
    if !order.get('ship_address')
      ship = @store.createRecord 'shipAddress'
      order.set('ship_address', ship)

  enter: -> @controllerFor('checkout').set('checkoutState', 'address')

# PAYMENT ROUTE
SiloStore.CheckoutPaymentRoute = Ember.Route.extend
  model: -> @store.find('order', 'current')

  setupController: (controller, model)->
    controller.set('content', model)

    order = model
    payments = order.get('payments')

    if payments.get('length') < 1
      payment = @store.createRecord 'payment', {
        amount: order.get('item_total')
        # Change this when adding more payment methods!
        payment_method_id: 1
      }
      order.get('payments').pushObject(payment)
    else
      payment = order.get('payments').get('firstObject')
      payment.set('amount', order.get('item_total'))
      # Change this when adding more payment methods!
      payment.set('payment_method_id', 1)

  enter: -> @controllerFor('checkout').set('checkoutState', 'payment')


# CONFIRM ROUTE
SiloStore.CheckoutConfirmRoute = Ember.Route.extend
  model: -> @store.find('order', 'current')

  setupController: (controller, model)->
    controller.set('content', model)

  enter: -> @controllerFor('checkout').set('checkoutState', 'confirm')
