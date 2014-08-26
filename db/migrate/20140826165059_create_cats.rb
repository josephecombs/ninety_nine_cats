class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.date :birth_date
      t.string :color, null: false
      t.string :sex, null: false
      t.text :description
      
      t.timestamps
    end
  end
end
