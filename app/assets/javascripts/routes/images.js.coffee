SiloStore.ImagesRoute = Ember.Route.extend
  enter: -> @controllerFor('admin').set('currentPage', 'Images')

SiloStore.ImagesIndexRoute = Ember.Route.extend
  model: -> @store.findAll('image')

  setupController: (controller, model)->
    controller.set('content', model)

# SiloStore.ReleasesShowRoute = Ember.Route.extend
#   model: (params) ->
#     SiloStore.Release.find(params.release_id)

# SiloStore.ReleasesUpdateRoute = Ember.Route.extend
#   model: (params) ->
#     SiloStore.Release.find(params.release_id)

# SiloStore.ReleasesNewRoute = Ember.Route.extend
#   model: -> @store.createRecord('release')

#   setupController: (controller, model)->
#     controller.set('content', model)