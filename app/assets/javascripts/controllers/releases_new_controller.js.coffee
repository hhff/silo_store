SiloStore.ReleasesNewController = Ember.ObjectController.extend

  actions:{
    addEntry: ->
      @content.save()

    setImageTempfile: (tempfile)->
      @set('image_id', id)

    setTrackTempfile: (track, tempfile)->
      track.set('tempfile', tempfile)

    addTrack: ()->
      @content.get('tracks').pushObject(@store.createRecord 'track')

  }