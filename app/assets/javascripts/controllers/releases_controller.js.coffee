SiloStore.ReleasesController = Ember.ArrayController.extend

  page:{
    name: "Releases"
  }

  actions:{
    addRelease: ->
      SiloStore.Release.createRecord(
        name: @get('newRelease-name'),
        type: @get('newRelease-type'))
      @set('newRelease-name', "")
      @set('newRelease-type', "")
  }