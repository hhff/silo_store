Ember.Application.initializer

  name: 'initializeUser'
  
  initialize: (container) ->

    store = container.lookup('store:main')
    controller = container.lookup('controller:admin')

    attributes = $('meta[name="current-user"]').attr('content')

    if attributes
      user = store.find('user', 'current')
      controller.set('content', user)