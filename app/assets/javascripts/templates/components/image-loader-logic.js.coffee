SiloStore.ImageLoaderComponent = Ember.Component.extend
  
  bindLoading: (->
    loader = @.$().find('.loader')
    content = @.$().find('.content')

    content.load(->
      loader.fadeOut(400, ->
        content.fadeIn(400)
      )
    )

  ).on('didInsertElement')