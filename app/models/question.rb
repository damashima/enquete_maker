class Question < ApplicationRecord
  belongs_to :end_user
  has_many :question_selects, dependent: :destroy
end
