SiloStore.SessionsNewRoute = Ember.Route.extend

  model: -> @store.createRecord('session')

  setupController: (controller, model) ->
    controller.set('content', model)

  enter: ->
    if @controllerFor('admin').get('isSignedIn')
      @transitionTo 'admin.dashboard'

SiloStore.SessionsDestroyRoute = Ember.Route.extend
  enter: ->
    self = @
    controller = @controllerFor('admin')

    $.ajax
      url: '/api/v1/sessions/current'
      type: 'DELETE'
      dataType: 'json'
      success: (data, textStatus, jqXHR) ->
        $('meta[name=current-user]').remove();
        controller.set('content', null)
        self.transitionTo('sessions.new').then(->
          SiloStore.reset()
        )