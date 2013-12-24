SiloStore.ApplicationController = Ember.ArrayController.extend
  
  needs: ['admin']

  actions: {
    getContext: ->
      console.log @get('currentPath')
  }
