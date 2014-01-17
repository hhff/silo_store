# For more information see: http://emberjs.com/guides/routing/

SiloStore.Router.map ()->

  @route 'frontend', path: '/'

  @resource 'products', ()->
    @route 'index', path: '/'
    @route 'show', path: '/:product_id'

  @route 'cart'

  @resource 'checkout', ()->
    @route 'address'
    @route 'payment'
    @route 'confirm'
    @route 'thankyou'




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
    @route 'connect', {queryParams: ['success','provider','username']}

  @resource 'users', ()->
    @route 'new'

  @resource 'sessions', ()->
    @route 'new'
    @route 'destroy'