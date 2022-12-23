class Answer < ApplicationRecord
  belongs_to :end_user
  belongs_to :question
  belongs_to :question_selects
end
