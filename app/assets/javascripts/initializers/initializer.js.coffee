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

# Ember.Application.initializer

#   name: 'initializerOrder'
  
#   initialize: (container, application) ->
    
#     store = container.lookup('store:main')
#     # order = store.find('order', 'current').get('content')

#     # application.register('order:current', order, {singleton: true});
#     application.inject('view:navbar', 'store', 'store:main');

#     alert 'initializer'

# Ember.Application.initializer
#   name: 'addStoreToViews'

#   initialize: (container, application) ->
#     application.inject('view', 'store', 'store:main')