class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.references :user, index: true 
      t.string :name
      t.string :race
      t.integer :age
      t.timestamps null: false
    end
  end
end
