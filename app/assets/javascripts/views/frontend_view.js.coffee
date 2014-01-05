SiloStore.FrontendView = Ember.View.extend
  templateName: 'frontend'

  didInsertElement: ->
    Ember.run.scheduleOnce 'afterRender', @, 'domReady'

  domReady: ->
    alert 'dom ready'
    # Jquery to go below
    frontend = @.$().find('#frontend')