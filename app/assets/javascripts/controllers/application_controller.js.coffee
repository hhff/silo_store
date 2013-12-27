SiloStore.ApplicationController = Ember.ArrayController.extend
  
  needs: ['admin']

  didInsertElement: ->
    alert 'inserted'

  actions: {
    getContext: ->
      console.log @get('currentPath')


  }
