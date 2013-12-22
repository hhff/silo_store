# For more information see: http://emberjs.com/guides/routing/

SiloStore.Router.map ()->
  @resource 'releases', ()->
    @route 'show', path: '/:release_id'
    @route 'update', path: '/:release_id/edit'
    @route 'new'

  @route 'dashboard', path: '/'
  @route 'settings'

  @resource 'users', ()->
    @route 'new'

  @resource 'sessions', ()->
    @route 'new'
    @route 'destroy'

