SiloStore.Order = DS.Model.extend
  number: DS.attr 'string'
  email: DS.attr 'string'
  state: DS.attr 'string'
  # item_total: DS.attr 'number'
  line_items: DS.hasMany 'lineItem', {embedded: 'true'}
  ship_address: DS.belongsTo 'shipAddress', {embedded: 'true'}
  completed_at: DS.attr 'date'
  payments: DS.hasMany 'payment', {embedded: 'true'}

  item_total: (->
    itemTotal = 0
    @get('line_items').forEach((lineItem)-> 
      if lineItem
        itemTotal = itemTotal+(lineItem.get('price') * lineItem.get('quantity'))
    )
    return itemTotal
  ).property('line_items')

  item_total_formatted: (->
    '$'+@get('item_total').toFixed(2)
  ).property('item_total')

  item_count: (->
    quantity = 0
    @get('line_items').forEach((lineItem)->
      if lineItem
        quantity = quantity+lineItem.get('quantity')
    )
    return quantity
  ).property('line_items')

  payment_required: (->
    if @get('item_total') > 0
      return true
    else
      return false
  ).property('item_total')

  shipment_required: (->
    nonDigital = 0
    @get('line_items').forEach((lineItem)->
      if lineItem.get('product') && lineItem.get('product').get('shipping_category').get('name') != "Digital"
        nonDigital++
    )
    if nonDigital > 0
      return true
    else
      return false
  ).property('line_items')

SiloStore.OrderSerializer = DS.RESTSerializer.extend

  serializeBelongsTo: (record, json, relationship)->
    key = relationship.key
    belongsToRecord = Ember.get(record, key)

    # Convert Camel Case to Snake Case for Rails (probably not necessary here)
    key = key.replace(/([A-Z])/g, ($1)->
      "_"+$1.toLowerCase()
    )#

    # Add attributes keyword for Rails accepts_nested_attributes_for method
    key = key+'_attributes'

    if belongsToRecord && relationship.options.embedded == 'true'
      json[key] = belongsToRecord.serialize()

    else
      @._super(record, json, relationship)

  serializeHasMany: (record, json, relationship)->  
    key = relationship.key
    hasManyRecords = Ember.get(record, key)

    key = key+'_attributes'

    if hasManyRecords && relationship.options.embedded == 'true'
      json[key] = []
      hasManyRecords.forEach (item, index)->
        json[key].push(item.serialize({ includeId: true }))

    else
      @._super(record, json, relationship)
