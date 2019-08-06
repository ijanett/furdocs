class CreateCharts < ActiveRecord::Migration[5.2]
  def change
    create_table :charts do |t|
      t.belongs_to :vet, foreign_key: true
      t.belongs_to :pet, foreign_key: true
      t.boolean :vaccination
      t.boolean :medication
      t.boolean :diagnosis
      t.text :note

      t.timestamps
    end
  end
end
