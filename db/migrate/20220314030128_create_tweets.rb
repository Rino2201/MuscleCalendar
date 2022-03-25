class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|

      t.integer :user_id, null: false
      t.text    :text, null: false
      t.string  :image_id
      t.date :start_time
      t.timestamps
    end
  end
end
