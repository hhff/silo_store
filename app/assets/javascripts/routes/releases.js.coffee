SiloStore.ReleasesIndexRoute = Ember.Route.extend
  model: -> SiloStore.Release.find()

  setupController: (controller, model)->
    controller.set('content', model)

SiloStore.ReleasesShowRoute = Ember.Route.extend
  model: (params) ->
    SiloStore.Release.find(params.release_id)

SiloStore.ReleasesUpdateRoute = Ember.Route.extend
  model: (params) ->
    SiloStore.Release.find(params.release_id)

SiloStore.ReleasesNewRoute = Ember.Route.extend
  model: -> SiloStore.Release.createRecord()

  setupController: (controller, model)->
    controller.set('content', model)