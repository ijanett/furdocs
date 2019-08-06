class CreateCharts < ActiveRecord::Migration[5.2]
  def change
    create_table :charts do |t|
      t.belongs_to :appointment, foreign_key: true
      t.boolean :vaccination
      t.boolean :medication
      t.boolean :diagnosis
      t.text :note

      t.timestamps
    end
  end
end
