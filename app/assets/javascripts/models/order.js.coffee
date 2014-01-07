SiloStore.Order = DS.Model.extend
  number: DS.attr 'string'
  lineItem: DS.hasMany('lineItem', {embedded: 'true'})
