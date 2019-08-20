class AddSpeciesColumnToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :species, :integer
  end
end
