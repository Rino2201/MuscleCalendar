class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|

      t.integer :user_id,            null: false, default: ""
      t.integer :training_id,        null: false, default: ""
      t.string  :title,              null: false, default: ""
      t.text    :text,               null: false, default: ""
      t.string  :image_id,                        default: ""
      t.datetime:start_time
      t.timestamps
    end
  end
end
