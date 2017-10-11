class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable

  has_many :posts
  has_many :comments

  # ДЗ Сформировать ActiveRecord запрос для получения всех постов, написанных администраторами(PS: creator = true)

  scope :creator, -> { where(creator: true) }

  # В консоли проверяем:

  # user1 = User.creator
  # Post.where(user: user1)



end
