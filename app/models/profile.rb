class Profile < ApplicationRecord
  belongs_to :user
  POSTAL_CODE_VALID = /\A\d{3}-\d{4}\z/i

  # registration
  validates :family_name,             presence: true, length: {maximum: 35}
  validates :personal_name,           presence: true, length: {maximum: 35}
  validates :family_name_kana,        presence: true, length: {maximum: 35}
  validates :personal_name_kana,      presence: true, length: {maximum: 35}
  validates :birthyear,               presence: true
  validates :birthmonth,              presence: true
  validates :birthday,                presence: true

  # sms
  validates :tel,                                     length: {maximum: 100}

  # address
  validates :postal_code,             presence: true, length: {maximum: 100}, format: { with: POSTAL_CODE_VALID }
  validates :prefecture,              presence: true, length: {maximum: 100}
  validates :city,                    presence: true, length: {maximum: 50}
  validates :house_code,              presence: true, length: {maximum: 35}
  validates :bulid_name,              presence: true
end