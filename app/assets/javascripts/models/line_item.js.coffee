SiloStore.LineItem = DS.Model.extend
  quantity: DS.attr 'number'
  price: DS.attr 'number'
  variantId: DS.attr 'number'
  product: DS.belongsTo 'product'

  total: (->
    @get('quantity') * @get('price')
  ).property('quantity', 'price')