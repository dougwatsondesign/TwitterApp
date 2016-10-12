class User < ApplicationRecord

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets
  has_many :relationships
  has_many :friends, through: :relationships

  has_many :inverse_relationships, class_name: "Relationship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_relationships, source: :user

  has_many :likes

  validates :username, presence: true, uniqueness: true


# This method will return a true/false on whether or not you've already liked that post.
  def likes?(tweet)
  	tweet.likes.where(user_id: id).any?
  end

end
