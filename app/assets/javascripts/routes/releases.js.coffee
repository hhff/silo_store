SiloStore.ReleasesRoute = Ember.Route.extend
  enter: -> @controllerFor('admin').set('currentPage', 'Releases')

SiloStore.ReleasesIndexRoute = Ember.Route.extend
  model: -> @store.findAll('release').then((releases)->
    releases: releases
  )

  setupController: (controller, model)->
    controller.set('content', model)

# SiloStore.ReleasesShowRoute = Ember.Route.extend
#   model: (params) ->
#     @store.find('release', params.release_id).then((release)->
#       release: release,
#       tracks: release.get('tracks')
#       # image: release.get('image')
#     )

  # setupController: (controller, model)->
  #   controller.set('content', model)

SiloStore.ReleasesUpdateRoute = Ember.Route.extend
  model: (params) ->
    @store.find('release', params.release_id)

SiloStore.ReleasesNewRoute = Ember.Route.extend
  # model: -> @store.createRecord('release').get('tracks').pushObject(@store.createRecord 'track')

  model: -> @store.createRecord('release',{

    tracks: @store.createRecord('track',{
      name: 'testTrack'
    })

  })

  afterModel: (release, transtion)->
    release.get('tracks').addObject(@store.createRecord 'track',{
      name: 'pushed Track after model'  
    }).pushObject(@store.createRecord 'track',{
      name: 'Blepshdflksahdjfafter model'  
    })

  setupController: (controller, model)->
    controller.set('content', model)