SiloStore.ReleasesUpdateController = Ember.ObjectController.extend

  actions:{
    destroy: ->
      @content.deleteRecord()
      @store.commit()

  }