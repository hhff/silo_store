# for more details see: http://emberjs.com/guides/views/

SiloStore.ReleasesView = Ember.View.extend
  templateName: 'releases'

  didInsertElement: ->
    @_super()
    alert('did insert')