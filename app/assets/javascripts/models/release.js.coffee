# for more details see: http://emberjs.com/guides/models/defining-models/

SiloStore.Release = DS.Model.extend
  name: DS.attr 'string'
  artist: DS.attr 'string'
  release_date: DS.attr 'string'
  upc_ean: DS.attr 'string'
  is_private: DS.attr 'boolean'
  image_id: DS.attr 'string'
  image_url: DS.attr 'string'