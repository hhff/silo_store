SiloStore.ReleasesShowController = Ember.ObjectController.extend

  actions:{
    sayHi: ->
      @get 'tracks'
      alert 'hi hugh'
  }