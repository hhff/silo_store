SiloStore.NavbarView = Ember.View.extend
  templateName: 'navbar'

  didInsertElement: ->
    Ember.run.scheduleOnce 'afterRender', @, 'navInserted'

  navInserted: ->
    # console.log @get('content').get('item_count')



