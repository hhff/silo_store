SiloStore.ImageLoaderComponent = Ember.Component.extend
  
  bindLoading: (->
    loader = @.$().find('.loader')
    content = @.$().find('.content').fadeOut(0)

    content.load(->
      loader.fadeOut(400, ->
        content.fadeIn(400)
      )
    )

  ).on('didInsertElement')