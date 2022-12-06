class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|

      t.integer :end_user_id
      t.text :text

      t.timestamps
    end
  end
end
