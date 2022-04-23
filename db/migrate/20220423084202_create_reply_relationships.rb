class CreateReplyRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :reply_relationships do |t|
      t.integer :main_tweet_id
      t.integer :reply_tweet_id

      t.timestamps
    end
    add_index :reply_relationships, :main_tweet_id 
    add_index :reply_relationships, :reply_tweet_id
  end
end
