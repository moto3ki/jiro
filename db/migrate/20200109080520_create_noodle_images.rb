class CreateNoodleImages < ActiveRecord::Migration[5.2]
  def change
    create_table :noodle_images do |t|
      t.string :image,           null: false
      t.references :shop,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
