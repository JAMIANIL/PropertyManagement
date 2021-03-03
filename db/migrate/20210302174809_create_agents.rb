class CreateAgents < ActiveRecord::Migration[6.1]
  def change
    create_table :agents do |t|
      t.string :first_name
      t.string :last_name
      t.string :role
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
