class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d{6,}]+\z/i.freeze
  VALID_CHINESE_CHAR = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  VALID_KATAKANA = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :password,              format: { with: VALID_PASSWORD }
    validates :nickname,              length: { maximum: 40 }
    validates :family_name,           format: { with: VALID_CHINESE_CHAR }
    validates :first_name,            format: { with: VALID_CHINESE_CHAR }
    validates :family_name_katakana,  format: { with: VALID_KATAKANA }
    validates :first_name_katakana,   format: { with: VALID_KATAKANA }
    validates :birthday
  end
end