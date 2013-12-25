Ember.Application.initializer
  
  name: 'admin'

  initialize: (container) ->

    store = container.lookup('store:main')
    attributes = $('meta[name="current-user"]').attr('content')

    if attributes
      user = store.find('user', 'current')
      controller = container.lookup('controller:admin').set('content', user)