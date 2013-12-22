SiloStore.UsersNewController = Ember.ObjectController.extend

  actions:{
    signUp: ->
      @content.save()
      @transitionToRoute 'releases'
  }