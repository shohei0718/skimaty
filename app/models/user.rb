class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,:gender,:prefecture,:age,presence: true

  belongs_to :prefecture

  has_many :lectures
  has_many :reviews
  has_many :favorites
  has_many :messages,dependent: :destroy
  has_many :entries,dependent: :destroy
  has_many :relationships
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

end
