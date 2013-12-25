SiloStore.SessionsNewRoute = Ember.Route.extend

  model: -> SiloStore.Session.createRecord()

  setupController: (controller, model) ->
    controller.set('content', model)

SiloStore.SessionsDestroyRoute = Ember.Route.extend
  enter: ->
    self = @
    controller = @controllerFor('admin')

    # user = SiloStore.User.find 'current'

    $.ajax
      url: '/api/v1/sessions/current'
      type: 'DELETE'
      dataType: 'json'
      success: (data, textStatus, jqXHR) ->
        controller.set('content', undefined)
        self.transitionTo('sessions.new').then(->
          SiloStore.reset()
        )



    # session = SiloStore.Session.find('current').then((session)->
    #   session.deleteRecord()
    #   SiloStore.store.commit()
    #   console.log 'Transition to Login Page!'
    # )
