SiloStore.CheckoutPaymentView = Ember.View.extend
  templateName: 'checkout/payment'

  actions: {
    createToken: ->
      controller = @get('controller')

      stripeResponseHandler = (status, response)->

        if status == 200
          controller.send('setupPaymentSource', response)
        else
          alert response.error.message

      stripeForm = @.$().find('form#stripe-form')
      Stripe.card.createToken(stripeForm, stripeResponseHandler)
  }



