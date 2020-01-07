class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.integer :user_id,        null: false, foreign_key: true
      t.string  :name,           null: false
      t.string  :address,   null: false
      t.string  :map,            null: false
      t.string  :horiday,        null: false
      t.text    :opening_hours,  null: false
      t.text    :menu,           null: false
      t.text    :rule
      t.text    :detail
      t.timestamps
    end
  end
end
