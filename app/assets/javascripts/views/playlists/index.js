SinistereoApp.Views.PlaylistsIndex = Backbone.View.extend({

  template: JST['playlists/index'],

  events: {
    'submit #new-playlist': 'createPlaylist',
    'click .remove-playlist': 'removePlaylist'
  },

  initialize: function () {
    this.collection.on('reset', this.render, this);
  },

  render: function() {
    $(this.el).html(this.template({
      playlists: this.collection
    }));
    return this
  },

  createPlaylist: function(event) {
    event.preventDefault();

    var attributes = {
      name: $('#new-playlists-name').val(),
      user_id: $('#new-playlist-user_ud').val(),
    }

    this.collection.create(attributes, {
      wait: false,
      success: function() {
        $('#new-playlist')[0].reset();
      },
      error: this.handleError
    });

    this.collection.trigger('reset');
  },

  removePlaylist: function(event) {
    event.preventDefault();
    console.dir(event);
    this.collection.get(event.target.id).destroy();
    this.collection.trigger('reset')
  },

  handleError: function(playlist, response) {
    if (response.status == 422) {
      var errors = $.parseJSON(response.responseText).errors;
      for (attribute in errors) {
        var messages = errors[attribute];
        for (var i = 0, len = message.lenth; i < len; i++ ) {
          message = messsages[i];
          alert("" + attribute + " " + message);
        }
      }
    }
  }

});
