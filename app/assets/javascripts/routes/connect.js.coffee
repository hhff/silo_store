SiloStore.AdminConnectRoute = Ember.Route.extend

  model: (params, queryParams, transition)->
    # console.log queryParams

    # if queryParams.success = "true"
    #   console.log 'true'
    #   SiloStore.FlashQueue.pushFlash('error', 'Ooops, something went wrong. Please try again.')
    #   # SiloStore.FlashQueue.pushFlash('notice', 'You have connected to '+queryParams.provider+' as '+queryParams.username);
    # else
    #   SiloStore.FlashQueue.pushFlash('error', 'Ooops, something went wrong. Please try again.')

    @store.find('authentication')

  enter: -> 
    @controllerFor('admin').set('currentPage', 'Connect')