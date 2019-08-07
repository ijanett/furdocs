class ChangeSexToBeIntegerInPets < ActiveRecord::Migration[5.2]
  def change
    rename_column :pets, :sex, :gender
    change_column :pets, :gender, :integer
  end
end
