SiloStore.CheckoutController = Ember.ObjectController.extend

  checkoutState: 'null'
  canEnter: true

  checkoutFlow: (->
    order = @get('content').order
    checkoutFlow = ['cart']
    if order.get('shipment_required')
      checkoutFlow.push('address')
    if order.get('payment_required')
      checkoutFlow.push('payment')
    checkoutFlow.push('confirm')
    checkoutFlow.push('thankyou')
    return checkoutFlow
  ).property('content')


  actions: {
    advance: ->
      currentState = @get('checkoutState')
      checkoutFlow = @get('checkoutFlow')

      # Note - We can't call 'advance' when we're on the final state for now...
      nextStep = checkoutFlow[checkoutFlow.indexOf(currentState)+1]
      @transitionToRoute('checkout.'+nextStep)

  }