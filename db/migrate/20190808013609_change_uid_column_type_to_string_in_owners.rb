class ChangeUidColumnTypeToStringInOwners < ActiveRecord::Migration[5.2]
  def change
    change_column :owners, :uid, :string
  end
end
