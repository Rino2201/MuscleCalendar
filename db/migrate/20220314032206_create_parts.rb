class CreateParts < ActiveRecord::Migration[6.1]
  def change
    create_table :parts do |t|

      t.string :part,    null: false, default: ""
      t.timestamps
    end
  end
end
