SiloStore.ReleasesIndexRoute = Ember.Route.extend
  model: -> SiloStore.Release.find()

SiloStore.ReleasesShowRoute = Ember.Route.extend
  model: (params) ->
    SiloStore.Release.find(params.release_id)

SiloStore.ReleasesUpdateRoute = Ember.Route.extend
  model: (params) ->
    SiloStore.Release.find(params.release_id)