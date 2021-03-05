class ChangeFieldsInLocks < ActiveRecord::Migration[6.1]
  def down
    change_column :locks, :company_id, :integer, :null =>true
    change_column :locks, :property_id, :integer, :null =>true
  end
e