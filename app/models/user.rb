class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :trainings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # フォローされる方
  has_many :reverse_of_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_follows, source: :follower

  # フォローする方
  has_many :follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :follows, source: :followed

  def follow(user)
    follows.create(followed_id: user.id)
  end

  def unfollow(user)
    follows.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  # enum is_active: { active: true, out: false }

end
