class Playlist < ActiveRecord::Base
  # Every playlist needs a unique name and an owner.
  validates :name, presence: true, uniqueness: true
  validates :user, presence: true

  belongs_to :user
  # Destroying a playlist should remove the song associations.
  # Why not :delete? The actual association is a through join table row.
  # De-associating in this case is deleting the row that connects the two.
  has_many :playlist_selections, dependent: :destroy
  has_many :songs, through: :playlist_selections
end
