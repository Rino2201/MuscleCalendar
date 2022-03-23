class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|

      t.string  :menu_name, null: false
      t.string  :part_name, null: false
      t.timestamps
    end
  end
end
