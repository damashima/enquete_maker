class QuestionSelect < ApplicationRecord
  belongs_to :question
  belongs_to :end_user
  has_many :answers
  #has_many :answers, dependent: :destroy
  validates :selected, presence: true, length: { maximum: 30 }
end
