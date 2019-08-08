class RemovePasswordDigestColumnFromOnwers < ActiveRecord::Migration[5.2]
  def change
    remove_column :owners, :password_digest
  end
end
