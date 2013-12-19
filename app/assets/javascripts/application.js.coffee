#= require jquery
#= require jquery_ujs
#= require foundation

#= require handlebars
#= require ember
#= require ember-data
#= require_self

#= require silo_store

# for more details see: http://emberjs.com/guides/application/
window.SiloStore = Ember.Application.create()

$ ->
  $(document).foundation()
