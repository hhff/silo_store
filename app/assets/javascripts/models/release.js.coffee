# for more details see: http://emberjs.com/guides/models/defining-models/

SiloStore.Release = DS.Model.extend
  name: DS.attr 'string'
  artist: DS.attr 'string'
  release_date: DS.attr 'string'
  upc_ean: DS.attr 'string'
  is_private: DS.attr 'boolean'
  image_url: DS.attr 'string'
  tracks: DS.hasMany('track', {embedded: 'true'})





# DS.ActiveModelSerializer.reopen
#   serializeHasMany: (record, json, relationship)->
#     key = relationship.key
#     hasManyRecords = Ember.get(record, key)
#     console.log 'serialize!!!'

#     if (hasManyRecords && relationship.options.embedded== 'always')
#       json[key] = []
#       hasManyRecords.forEach((item, index)->
#         json[key].push(item.serialize())
#       )
#     else
#       @._super(record, json, relationship)


# DS.JSONSerializer.reopen({
#     serializeHasMany: function(record, json, relationship) {
#         var key = relationship.key,
#             hasManyRecords = Ember.get(record, key);
         
#         // Embed hasMany relationship if records exist
#         if (hasManyRecords && relationship.options.embedded == 'always') {
#             json[key] = [];
#             hasManyRecords.forEach(function(item, index){
#                 json[key].push(item.serialize());
#             });
#         }
#         // Fallback to default serialization behavior
#         else {
#             return this._super(record, json, relationship);
#         }
#     }
# });





# SiloStore.ReleaseSerializer = DS.JSONSerializer.extend
#   extractSingle: (store, type, payload, id, requestType) ->
#     tracks = payload.release.tracks
#     trackIds = tracks.mapProperty 'id'

#     payload.tracks = tracks
#     payload.release.tracks = trackIds

#     @_super.apply(@, arguments)

# App.PostSerializer = DS.RESTSerializer.extend({
#   extractSingle: function(store, type, payload, id, requestType) {
#     var comments = payload.post.comments,
#         commentIds = comments.mapProperty('id');

#     payload.comments = comments;
#     payload.post.comments = commentIds;

#     return this._super.apply(this, arguments);
#   }
# });