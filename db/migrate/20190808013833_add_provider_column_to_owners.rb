class AddProviderColumnToOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :provider, :string
  end
end
