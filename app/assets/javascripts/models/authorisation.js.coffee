# for more details see: http://emberjs.com/guides/models/defining-models/

SiloStore.Authentication = DS.Model.extend
  provider: DS.attr 'string'
  username: DS.attr 'string'
