SiloStore.ProductsView = Ember.View.extend
  templateName: 'products'

  # willAnimateIn: ()->
  #     this.$().css("opacity", 0)

  # animateIn: (done)->
  #     this.$().fadeTo(500, 1, done)
  
  # animateOut: (done)->
  #     this.$().fadeTo(500, 0, done)

  willInsertElement: ->
    Ember.run.scheduleOnce 'afterRender', @, 'domReady'

  domReady: ->
    # Global Variables Here
    # frontend = @.$().find('#frontend')
    # navbar = frontend.find('.top-bar')
    # navbarHeight = navbar.height()
    # navbarContainer = frontend.find('.contain-to-grid')
    # navbarSpacer = frontend.find('.nav-spacer')
    # screens = frontend.find('.screen-height')
    # minHeight = 600;

    # # Utility Functions Here
    # scroll = ->
    #   navbarOffset = navbarSpacer.offset().top
    #   scrollTop = $(@).scrollTop()
    #   if scrollTop >= navbarOffset
    #     navbarContainer.addClass('fixed')
    #   else
    #     navbarContainer.removeClass('fixed')

    # setupScreens = ->
    #   screens.each ->
    #     myHeight = $(window).height()
    #     $(@).height(Math.max(myHeight - navbarHeight, minHeight))

    # loadIn = ->
    #   frontend.removeClass('hidden')

    # # Setup Bindings After All Functions Declared
    # setupBindings = ->
    #   $(window).resize ->
    #     setupScreens()
    #     scroll()
      
    #   $(window).scroll ->
    #     scroll()

    # # Bring it all together
    # init = ->
    #   setupScreens()
    #   setupBindings()
    #   loadIn()

    # init()


