class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  # :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]
  # :recoverable, :rememberable, :confirmable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_many :authorizations

  has_many :posts
  has_many :comments

  # ДЗ Сформировать ActiveRecord запрос для получения всех постов, написанных администраторами(PS: creator = true)

  # scope :creator, -> { where(creator: true) }

  # В консоли проверяем:

  # user1 = User.creator
  # Post.where(user: user1)

  def self.find_for_oauth(auth)
    authorization = Authorization.where(provider: auth.provider, uid: auth.uid.to_s).first
    return authorization.user if authorization

    email = auth.info[:email]
    user = User.where(email: email).first
    if user
      user.create_authorization(auth)
    else
      password = Devise.friendly_token[0, 20]
      user = User.create!(email: email, password: password, password_confirmation: password)
      user.create_authorization(auth)
    end

    user
  end

  def create_authorization(auth)
    self.authorizations.create(provider: auth.provider, uid: auth.uid)
  end

end
