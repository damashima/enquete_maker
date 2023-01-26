class QuestionSelect < ApplicationRecord
  belongs_to :question
  has_many :answers
  #has_many :answers, dependent: :destroy
  validates :selected, presence: true, length: { maximum: 10 }
end
