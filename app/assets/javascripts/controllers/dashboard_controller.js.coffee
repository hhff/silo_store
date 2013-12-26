SiloStore.AdminDashboardController = Ember.ArrayController.extend
  
  actions: {
    triggerFlash: ->
      SiloStore.FlashQueue.pushFlash('notice', 'This is a notice.');
      SiloStore.FlashQueue.pushFlash('warning', 'This is a warning.');
      SiloStore.FlashQueue.pushFlash('error', 'This is an error.');

  }
