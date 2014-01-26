# for more details see: http://emberjs.com/guides/views/

SiloStore.ApplicationView = Ember.View.extend
  templateName: 'application'

  didInsertElement: ->
    Ember.run.scheduleOnce 'afterRender', @, 'appInserted'

  appInserted: ->
    preloader = $(document).find('#preloader')
    preloader.addClass('loaded')

