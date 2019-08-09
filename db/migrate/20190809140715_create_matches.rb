class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      # Person following
      t.integer :follower_id
      # Person being followed
      t.integer :followee_id
      

      t.timestamps
    end
  end
end
