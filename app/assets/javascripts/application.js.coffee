#= require jquery
#= require jquery_ujs

#= require jquery.ui.all
#= require jquery-fileupload/basic
#= require jquery-fileupload/vendor/tmpl

#= require foundation
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require silo_store

# for more details see: http://emberjs.com/guides/application/
window.SiloStore = Ember.Application.create()

Ember.FEATURES["query-params"] = true;

$ ->
  $(document).foundation()

  spreeApiKey = $('meta[name="spree-guest-api-key"').attr('content')

  $.ajaxPrefilter((options, originalOptions, xhr)->
    xhr.setRequestHeader('X-Spree-Token', spreeApiKey);  
  )