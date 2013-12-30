SiloStore.ReleasesNewController = Ember.ObjectController.extend

  actions:{
    addEntry: ->
      # @content.get('tracks').save().then((response)->
      #   for track in response
      #     console.log track.id
      # )
      @content.save()
      # @transitionToRoute('releases')

    setImageID: (id)->
      @set('image_id', id)

    addTrack: ()->
      @content.get('tracks').pushObject(@store.createRecord 'track')

    findTracks: ()->
      tracks = @content.get('tracks')
      console.log tracks
      console.log @content

  }