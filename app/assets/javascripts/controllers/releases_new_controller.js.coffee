SiloStore.ReleasesNewController = Ember.ObjectController.extend

  actions:{
    addEntry: ->
      @content.save()
      @transitionToRoute('releases')
  }