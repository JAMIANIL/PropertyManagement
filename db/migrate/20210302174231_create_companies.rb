class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :contact_number
      t.string :email
      t.date :founded_year

      t.timestamps
    end
  end
end
