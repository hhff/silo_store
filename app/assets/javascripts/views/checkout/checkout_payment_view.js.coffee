SiloStore.CheckoutPaymentView = Ember.View.extend
  templateName: 'checkout/payment'

  # willAnimateIn: ()->
  #     this.$().css("opacity", 0)

  # animateIn: (done)->
  #     this.$().fadeTo(500, 1, done)
  
  # animateOut: (done)->
  #     this.$().fadeTo(500, 0, done)

  willInsertElement: ->
    Ember.run.scheduleOnce 'afterRender', @, 'domReady'

  domReady: ->
    # Nothing here yet

  actions: {
    createToken: ->
      controller = @get('controller')
      controller.set('isLoading', true)

      stripeResponseHandler = (status, response)->

        if status == 200
          controller.send('setupPaymentSource', response)
        else
          alert response.error.message

      stripeForm = @.$().find('form#stripe-form')
      Stripe.card.createToken(stripeForm, stripeResponseHandler)
  }



