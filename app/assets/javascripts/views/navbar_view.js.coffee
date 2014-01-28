SiloStore.NavbarView = Ember.View.extend
  templateName: 'navbar'

  didInsertElement: ->
    Ember.run.scheduleOnce 'afterRender', @, 'navInserted'

  navInserted: ->
    # Global Variables Here