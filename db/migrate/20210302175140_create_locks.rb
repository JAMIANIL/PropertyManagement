class CreateLocks < ActiveRecord::Migration[6.1]
  def change
    create_table :locks do |t|
      t.integer :number
      t.integer :company_id
      t.integer :property_id

      t.timestamps
    end
  end
end
