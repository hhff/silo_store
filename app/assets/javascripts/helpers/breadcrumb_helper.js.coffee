Ember.Handlebars.helper('breadcrumb', (checkoutFlow, checkoutState)->
  breadcrumb = ''
  checkoutStateIndex = checkoutFlow.indexOf(checkoutState)

  for step in checkoutFlow
    if step == checkoutState
      breadcrumb+='<div class="crumb active"><h5>'+step.charAt(0).toUpperCase()+step.slice(1)+'</h5></div>'
    else if checkoutFlow.indexOf(step) > checkoutStateIndex
      breadcrumb+='<div class="crumb inactive"><h5>'+step.charAt(0).toUpperCase()+step.slice(1)+'</h5></div>'    
    else
      breadcrumb+='<div class="crumb"><a href="#/checkout/'+step+'"><h5>'+step.charAt(0).toUpperCase()+step.slice(1)+'</h5></a></div>'

  return new Handlebars.SafeString breadcrumb
)
