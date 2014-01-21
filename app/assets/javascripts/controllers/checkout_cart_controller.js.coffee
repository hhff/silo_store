SiloStore.CheckoutCartController = Ember.ObjectController.extend


  actions: {
  }

  # totalItems (->

  # ).property()

  hasOrder: (->
    @get('content') != null
  ).property('content')