SiloStore.Product = DS.Model.extend
  name: DS.attr 'string'

  shipping_category: DS.belongsTo 'shippingCategory'