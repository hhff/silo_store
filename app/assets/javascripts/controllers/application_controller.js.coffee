SiloStore.ApplicationController = Ember.ArrayController.extend
  
  needs: []

  actions: {
    getContext: ->
      console.log @get('currentPath')
  }
