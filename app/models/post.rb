class Post < ApplicationRecord
  belongs_to :customer
  attachment :image
  acts_as_taggable
  has_many :comments, dependent: :destroy
end