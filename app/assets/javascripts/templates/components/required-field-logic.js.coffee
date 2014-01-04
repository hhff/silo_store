SiloStore.RequiredFieldComponent = Ember.Component.extend

  classNameBindings: ['isValid:valid:invalid']
  isValid: false


  init: (->
    alert 'hi from required'
  ).on('didInsertElement')