class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :questions, dependent: :destroy
  has_many :question_selects, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, uniqueness: true
  validates :name, length: { in: 1..10 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
