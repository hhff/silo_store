SiloStore.CheckoutController = Ember.ObjectController.extend

  needs: ['application']

  checkoutState: 'cart'

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
      @set('checkoutState', nextStep)      
      @transitionToRoute('checkout.'+nextStep)

    back: ->
      currentState = @get('checkoutState')
      checkoutFlow = @get('checkoutFlow')
      # Note - We can't call 'back' when on cart... but cart never goes back...
      previousStep = checkoutFlow[checkoutFlow.indexOf(currentState)-1]
      @set('checkoutState', previousStep)      
      @transitionToRoute('checkout.'+previousStep)

    canEnter: (attemptedState) ->
      currentState = @get('checkoutState')
      checkoutFlow = @get('checkoutFlow')

      if checkoutFlow.indexOf(attemptedState) == -1 || checkoutFlow.indexOf(currentState) < checkoutFlow.indexOf(attemptedState)
        @set('checkoutState', currentState)
        @transitionToRoute('checkout.'+currentState)
      else
        @set('checkoutState', attemptedState)

        # This statement wipes the order if it's the final step in the flow...
        # if checkoutFlow.indexOf(attemptedState) == (checkoutFlow.length - 1)
          # COMING SOON!

  }