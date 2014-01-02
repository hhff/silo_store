# for more details see: http://emberjs.com/guides/models/defining-models/

SiloStore.Track = DS.Model.extend
  name: DS.attr 'string'
  isrc: DS.attr 'string'
  tempfile: DS.attr 'string'