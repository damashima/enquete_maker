class Question < ApplicationRecord
  belongs_to :end_user
  has_many :question_selects, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  accepts_nested_attributes_for :question_selects

  validates :text, presence: true, length: { maximum: 30 }

  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end
end
