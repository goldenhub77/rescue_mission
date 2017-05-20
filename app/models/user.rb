class User < ApplicationRecord
  has_many :questions
  has_many :answers

  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
  validates :name, presence: true
  validates :email, allow_blank: true, format: { with: /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i }
  validates :avatar_url, presence: true, format: { with: /([a-zA-Z]+):\/\/(-\.)?(([^\s\/?\.#\-]+|([^\s\/?\.#\-]-[^\s\/?\.#\-]))\.?)+(\/[^\s]*)?/i }
  validates :token, presence: true, uniqueness: true


  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])

    user.nickname = auth['info']['nickname']
    user.name = auth['info']['name']
    user.email = auth['info']['email']
    user.avatar_url = auth['info']['image']
    user.token = auth['credentials']['token']
    user.save
    user
  end
end
