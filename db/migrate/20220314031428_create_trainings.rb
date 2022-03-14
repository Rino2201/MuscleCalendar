class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|

      t.integer :user_id,            null: false, default: ""
      t.integer :menu_id,            null: false, default: ""
      t.integer :weight,                          default: ""
      t.integer :rep,                             default: ""
      t.integer :set,                             default: ""
      t.timestamps
    end
  end
end
