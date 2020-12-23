class Post < ApplicationRecord
  belongs_to :customer
  attachment :image
  acts_as_taggable
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end

  belongs_to :area
end