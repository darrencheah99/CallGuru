class CreatePlaybooks < ActiveRecord::Migration[5.2]
  def change
    create_table :playbooks do |t|
      t.string :name
      t.text :description
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
