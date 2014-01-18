# SiloStore.CheckoutRoute = Ember.Route.extend
#   enter: -> @controllerFor('admin').set('currentPage', 'Releases')


SiloStore.CheckoutAddressRoute = Ember.Route.extend
  model: -> @store.find('order', 'current')

  setupController: (controller, model)->
    controller.set('content', model)

    order = model
    if !order.get('ship_address')
      ship = @store.createRecord 'shipAddress'
      order.set('ship_address', ship)

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

SiloStore.CheckoutConfirmRoute = Ember.Route.extend
  model: -> @store.find('order', 'current')

  setupController: (controller, model)->
    controller.set('content', model)  