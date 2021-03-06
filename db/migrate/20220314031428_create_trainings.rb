class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|

      t.integer :user_id, null: false
      t.integer :menu_id, null: false
      t.integer :weight
      t.string  :unit
      t.integer :rep
      t.integer :set
      t.date :start_time
      t.timestamps
    end
  end
end
