# for more details see: http://emberjs.com/guides/models/defining-models/

SiloStore.Session = DS.Model.extend
  email: DS.attr 'string'
  password: DS.attr 'string'
