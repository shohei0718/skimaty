class Lecture < ApplicationRecord
  belongs_to :user
  belongs_to :condition
  belongs_to :genre
  belongs_to :prefecture
  has_many :favorites
  has_many :reviews
  has_many :relationships
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
end
