SiloStore.Product = DS.Model.extend
  name: DS.attr 'string'
  artist: DS.attr 'string'
  format: DS.attr 'string'

  shipping_category: DS.belongsTo 'shippingCategory'

  images: DS.hasMany 'image'