SiloStore.TrackUploaderComponent = Ember.Component.extend
  
  initiateFileuploader: (->

    track = @.get 'model'

    self = @

    @.$().find('#track-uploader').fileupload
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
        console.log 'hi im here'
        self.sendAction('action', track, e.responseJSON.tempfile)

  ).on('didInsertElement')