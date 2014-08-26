class CreateCatRentalRequests < ActiveRecord::Migration
  def change
    create_table :cat_rental_requests do |t|
      t.integer :cat_id #FK to Cats
      t.date :start_date null: false
      t.date :end_date null: false
      t.string :status
      
      t.timestamps
    end
    
    add_index :cat_rental_requests, :cat_id, presence: :true
  end
end
