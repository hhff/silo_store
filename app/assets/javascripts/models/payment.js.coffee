SiloStore.Payment = DS.Model.extend
  amount: DS.attr 'string'
  source: DS.belongsTo 'source'
  payment_method_id: DS.attr 'number'

SiloStore.PaymentSerializer = DS.RESTSerializer.extend

  serializeBelongsTo: (record, json, relationship)->
    key = relationship.key
    belongsToRecord = Ember.get(record, key)

    # Convert Camel Case to Snake Case for Rails (probably not necessary here)
    key = key.replace(/([A-Z])/g, ($1)->
      "_"+$1.toLowerCase()
    )#

    # Add attributes keyword for Rails accepts_nested_attributes_for method
    key = key+'_attributes'

    if belongsToRecord# && relationship.options.embedded == 'true'
      json[key] = belongsToRecord.serialize()

    else
      @._super(record, json, relationship)
