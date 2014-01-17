SiloStore.Source = DS.Model.extend
  month: DS.attr 'string'
  year: DS.attr 'string'
  cc_type: DS.attr 'string'
  last_digits: DS.attr 'string'
  first_name: DS.attr 'string'
  last_name: DS.attr 'string'
  gateway_payment_profile_id: DS.attr 'string'