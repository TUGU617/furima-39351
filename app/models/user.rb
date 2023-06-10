class User < ApplicationRecord
  validates :nickname, presence: true
  validates :last_name, presence: true,format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
  validates :first_name, presence: true,format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
  validates :last_name_kana, presence: true,format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true,format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :date_of_birth, presence: true
  validate :password_complexity

  has_many :items
  has_many :purchase_record
  private

  def password_complexity
    if password.present? && !password.match(/\A(?=.*?[a-zA-Z])(?=.*?[0-9])/)
      errors.add(:password, 'は半角英字と半角数字の両方を含める必要があります')
    end
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
