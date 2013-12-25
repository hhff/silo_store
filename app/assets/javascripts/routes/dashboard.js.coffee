SiloStore.AdminDashboardRoute = Ember.Route.extend
  enter: -> @controllerFor('admin').set('currentPage', 'Dashboard')