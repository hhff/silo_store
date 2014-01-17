SiloStore.Address = DS.Model.extend
  firstname: DS.attr 'string'
  lastname: DS.attr 'string'
  address1: DS.attr 'string'
  address2: DS.attr 'string'
  city: DS.attr 'string'
  zipcode: DS.attr 'string'
  phone: DS.attr 'string'
  country_id: DS.attr 'number'
  state_id: DS.attr 'number'



SiloStore.ShipAddress = SiloStore.Address.extend()
SiloStore.BillAddress = SiloStore.Address.extend()



# SiloStore.ReleaseSerializer = DS.RESTSerializer.extend

#   serializeHasMany: (record, json, relationship)->  
#     key = relationship.key
#     hasManyRecords = Ember.get(record, key)

#     key = key+'_attributes'

#     if hasManyRecords && relationship.options.embedded == 'true'
#       json[key] = []
#       hasManyRecords.forEach (item, index)->
#         json[key].push(item.serialize())
#     else
#       @._super(record, json, relationship)
