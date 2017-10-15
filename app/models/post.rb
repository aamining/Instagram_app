class Post < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  mount_uploader :image
end
