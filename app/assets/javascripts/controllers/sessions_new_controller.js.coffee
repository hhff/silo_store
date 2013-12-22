SiloStore.SessionsNewController = Ember.ObjectController.extend

  actions:{
    logIn: ->
      @content.save().then(->

        console.log 'Session Saved!'

        userJSON = @content.toJSON()
        userJSON.id = 'current'

        object = @store.load(SiloStore.User, userJSON)
        user = SiloStore.User.find 'current'

      )

  }