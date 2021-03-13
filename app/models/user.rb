class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :orders

  with_options presence: true do
    validates :nick_name
    validates :birthday
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'is Full-width characters' } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A([ァ-ン]|ー)+\z/, message: 'is must NOT contain any other characters than alphanumerics' } do
      validates :first_name_kana
      validates :last_name_kana
    end
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
