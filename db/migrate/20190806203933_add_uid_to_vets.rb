class AddUidToVets < ActiveRecord::Migration[5.2]
  def change
    add_column :vets, :uid, :integer
  end
end
