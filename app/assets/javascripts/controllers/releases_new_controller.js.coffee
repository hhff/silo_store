SiloStore.ReleasesNewController = Ember.ObjectController.extend

  actions:{
    addEntry: ->
      @content.save()
      @transitionToRoute('releases')

    setImageID: (id)->
      @set('image_id', id)

  }