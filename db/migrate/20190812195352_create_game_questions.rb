class CreateGameQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :game_questions do |t|
      t.integer :question_id
      t.integer :game_id

      t.timestamps
    end
  end
end
