class PlaylistSelection < ActiveRecord::Base
  # These associations are just so that songs can get associated playlists
  # and playlists can get associated songs.
  belongs_to :song
  belongs_to :playlist
end
