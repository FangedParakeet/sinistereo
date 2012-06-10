window.SinistereoApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  init: function() {
    new SinistereoApp.Routers.Playlists();
    Backbone.history.start ();
  }
};
