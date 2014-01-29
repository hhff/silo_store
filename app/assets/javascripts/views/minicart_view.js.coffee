SiloStore.MinicartView = Ember.View.extend
  templateName: 'minicart'

  didInsertElement: ->
    Ember.run.scheduleOnce 'afterRender', @, 'minicartInserted'

  minicartInserted: ->
    # Global Variables Here
    minicart = @.$().find('#minicart')
    navbar = $(document).find('.top-bar')
    navbarHeight = navbar.height()
    minicartOffset = minicart.offset().top

    scroll = ->
      scrollTop = $(window).scrollTop()
      minicartStickpoint = (minicartOffset - navbarHeight - 15)

      if scrollTop > minicartStickpoint
        scrollOffset = scrollTop - minicartStickpoint
        minicart.css({
          '-webkit-transform': 'translateY('+scrollOffset+'px)',
          '-moz-transform': 'translateY('+scrollOffset+'px)',
          '-ms-transform': 'translateY('+scrollOffset+'px)',
          '-o-transform': 'translateY('+scrollOffset+'px)',
          'transform': 'translateY('+scrollOffset+'px)'
        })

    setupBindings = ->
      $(window).scroll ->
        scroll()

    init = ->
      setupBindings()

    init()