class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
    add_index :tweets, [:user_id, :created_at]
  end
end
