# For more information see: http://emberjs.com/guides/routing/

SiloStore.Router.map ()->

  @route 'frontend', path: '/'

  @resource 'admin', ()->

    @resource 'releases', ()->
      @route 'index', path: '/'
      @route 'show', path: '/:release_id'
      @route 'update', path: '/:release_id/edit'
      @route 'new'

    @resource 'images', ()->
      @route 'index', path: '/'

    @route 'dashboard'
    @route 'settings'
    @route 'connect'

  @resource 'users', ()->
    @route 'new'

  @resource 'sessions', ()->
    @route 'new'
    @route 'destroy'