class User < ActiveRecord::Base
  # Destroying a user should destroy their playlists.
  has_many :playlists, dependent: :destroy
end
