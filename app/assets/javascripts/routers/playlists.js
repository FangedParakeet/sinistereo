SinistereoApp.Routers.Playlists = Backbone.Router.extend({

  routes: {
    '': 'index' //change to show action once backbone is working
    '': 'show' 
 },
  
  initialize: function() {
    this.playlists = new SinistereoApp.Collections.Playlists()
    this.playlists.fetch();
  },
  
  index: function() {
    var playlistsView = new SinistereoApp.Views.PlaylistsIndex({
      collection: this.playlists
    });
    $('#playlists').html(playlistsView.el);
  }
  
  index: function() {
    var playlistView = new SinistereoApp.Views.PlaylistsShow({
      collection: this.playlist
    });
    $('#playlist').html(playlistView.el);
  }
});
