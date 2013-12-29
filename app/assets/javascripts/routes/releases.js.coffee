SiloStore.ReleasesRoute = Ember.Route.extend
  enter: -> @controllerFor('admin').set('currentPage', 'Releases')

SiloStore.ReleasesIndexRoute = Ember.Route.extend
  model: -> @store.findAll('release')

  setupController: (controller, model)->
    controller.set('content', model)

SiloStore.ReleasesShowRoute = Ember.Route.extend
  model: (params) ->
    @store.find('release', params.release_id).then((release)->
      release: release,
      tracks: release.get('tracks'),
      image: release.get('image')
    )

  setupController: (controller, model)->
    controller.set('content', model)

# SiloStore.ReleasesUpdateRoute = Ember.Route.extend
#   model: (params) ->
#     SiloStore.Release.find(params.release_id)

SiloStore.ReleasesNewRoute = Ember.Route.extend
  model: -> @store.createRecord('release')

  setupController: (controller, model)->
    controller.set('content', model)