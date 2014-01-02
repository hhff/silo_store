SiloStore.Release = DS.Model.extend
  name: DS.attr 'string'
  artist: DS.attr 'string'
  release_date: DS.attr 'string'
  upc_ean: DS.attr 'string'
  is_private: DS.attr 'boolean'
  images: DS.hasMany 'image', {embedded: 'true'}
  tracks: DS.hasMany('track', {embedded: 'true'})


SiloStore.ReleaseSerializer = DS.RESTSerializer.extend

  serializeHasMany: (record, json, relationship)->  
    key = relationship.key
    hasManyRecords = Ember.get(record, key)

    key = key+'_attributes'

    if hasManyRecords && relationship.options.embedded == 'true'
      json[key] = []
      hasManyRecords.forEach (item, index)->
        json[key].push(item.serialize())
    else
      @._super(record, json, relationship)
