# Ember.Application.initializer
  
#   name: 'admin'

#   initialize: (container) ->

#     store = container.lookup 'store:main'
#     user = SiloStore.User.find 'current'

#     container.lookup('controller:admin').set('content', user)
#     # container.typeInjection('controller', 'currentUser', 'controller:currentUser')

#     console.log 'Initializer Working!'