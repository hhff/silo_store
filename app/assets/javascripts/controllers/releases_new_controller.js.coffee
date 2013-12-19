SiloStore.ReleasesNewController = Ember.ArrayController.extend

  actions:{
    addEntry: ->
      newRelease = SiloStore.Release.createRecord(name: @get('newRelease-name'))
      newRelease.save()
      @transitionToRoute('releases')
  }