SiloStore.CheckoutCartView = Ember.View.extend
  templateName: 'checkout/cart'

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


