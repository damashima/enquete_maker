class CreateQuestionSelects < ActiveRecord::Migration[6.1]
  def change
    create_table :question_selects do |t|
      t.integer :question_id
      t.string :selected

      t.timestamps
    end
  end
end
