SiloStore.ArtworkUploaderComponent = Ember.Component.extend
  
  initiateFileuploader: (->

    self = @

    @.$().find('#artwork-uploader').fileupload
      dataType: "JSON"
      autoUpload: true
      add: (e, data) ->
        data.url = '/api/v1/temporary'
        data.submit()

      progress: (e, data) ->
        if data.context
          progress = parseInt(data.loaded / data.total * 100, 10)
          console.log progress

      complete: (e, data) ->
        self.sendAction('action', e.responseJSON.tempfile)

  ).on('didInsertElement')