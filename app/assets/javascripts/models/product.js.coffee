SiloStore.Product = DS.Model.extend
  name: DS.attr 'string'

  shipping_category: DS.belongsTo 'shippingCategory'

  images: DS.hasMany 'image'