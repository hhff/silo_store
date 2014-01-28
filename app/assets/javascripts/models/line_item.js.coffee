SiloStore.LineItem = DS.Model.extend
  quantity: DS.attr 'number'
  price: DS.attr 'number'
  variantId: DS.attr 'number'
  order: DS.belongsTo 'order'
  product: DS.belongsTo 'product'

  price_formatted: (->
    '$'+@get('price').toFixed(2)
  ).property('price')

  total: (->
    '$'+(@get('quantity') * @get('price')).toFixed(2)
  ).property('quantity', 'price')