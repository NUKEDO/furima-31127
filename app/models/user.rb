class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d{6,}]+\z/i.freeze
  VALID_CHINESE_CHAR = /\A[ぁ-んァ-ン一-龥]+\z/
  VALID_KATAKANA = /\A[ァ-ン]+\z/
  validates :password,              presence: true, format: { with: VALID_PASSWORD }
  validates :nickname,              presence: true, length: { maximum: 40 }
  validates :family_name,           presence: true, format: { with: VALID_CHINESE_CHAR }
  validates :first_name,            presence: true, format: { with: VALID_CHINESE_CHAR }
  validates :family_name_katakana,  presence: true, format: { with: VALID_KATAKANA }
  validates :first_name_katakana,   presence: true, format: { with: VALID_KATAKANA }
  validates :birthday,              presence: true
end
