Ember.Application.initializer
  
  name: 'admin'

  initialize: (container) ->

    attributes = $('meta[name="current-user"]').attr('content')

    if attributes
      user = SiloStore.User.find 'current'
      controller = container.lookup('controller:admin').set('content', user)
