SiloStore.AdminConnectRoute = Ember.Route.extend
  model: -> @store.find('user', 'current')

  enter: -> @controllerFor('admin').set('currentPage', 'Connect')