class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :role
      t.string :first_name
      t.string :last_name
      t.integer :expertise_level

      t.timestamps
    end
  end
end
