class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :content
      t.integer :game_question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
