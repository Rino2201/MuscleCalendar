class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|

      t.integer :part_id,      null: false, default: ""
      t.string  :menu_name,    null: false, default: ""
      t.timestamps
    end
  end
end
