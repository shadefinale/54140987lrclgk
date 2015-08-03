class Song < ActiveRecord::Base
  # Not listed, but destroying a song should remove the playlist associations.
  # Why not :delete? The actual association is through a join table row.
  # De-associating in this case is deleting the row that connects the two.
  has_many :playlist_selections, dependent: :destroy
  has_many :playlists, through: :playlist_selections
end
