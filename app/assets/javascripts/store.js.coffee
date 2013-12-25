# SiloStore.Store = DS.Store.extend
#   adapter: DS.RESTAdapter.create({ namespace: 'api/v1' })


SiloStore.Store = DS.Store.extend
  adapter: DS.ActiveModelAdapter.reopen
    namespace: 'api/v1'