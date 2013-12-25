SiloStore.SessionsNewController = Ember.ObjectController.extend

  needs: ['admin']

  actions:{
    logIn: ->
      self = @
      content = @content

      @content.save().then(->
        self.get('controllers.admin').set('content', content);
        self.transitionToRoute 'admin.dashboard'
      )
  }