# for more details see: http://emberjs.com/guides/models/defining-models/

SiloStore.User = DS.Model.extend
  email: DS.attr 'string'
  password: DS.attr 'string'
  passwordConfirmation: DS.attr 'string'

