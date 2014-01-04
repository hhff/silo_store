SiloStore.TrackUploaderComponent = Ember.Component.extend
  
  initiateFileuploader: (->

    track = @.get 'model'

    self = @

    button = @.$().find('#track-uploader-button')

    @.$().find('#track-uploader').fileupload
      dataType: "JSON"
      autoUpload: true
      add: (e, data) ->
        file = data.files[0]
        console.log file.name
        button.append(file.name)
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