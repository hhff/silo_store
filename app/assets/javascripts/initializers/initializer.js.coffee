Ember.Application.initializer

  name: 'initializeUser'
  
  initialize: (container) ->

    store = container.lookup('store:main')
    controller = container.lookup('controller:admin')

    userPresent = $('meta[name="current-user"]').attr('content')

    pipeContext = $('meta[name="pipe-context"]').attr('content')

    if userPresent
      user = store.find('user', 'current')
      controller.set('content', user)

Ember.Application.initializer

  name: 'initializerOrder'
  
  initialize: (container) ->

    store = container.lookup('store:main')
    controller = container.lookup('controller:cart')

    order = store.find('order', 'current')
    controller.set('content', order)