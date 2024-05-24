class CreateRecetas < ActiveRecord::Migration[6.1]
  def change
    create_table :recetas do |t|
      t.string :nombre
      t.string :ingredientes
      t.string :pasos
      t.integer :tiempo_preparacion
      t.references :usuario, null: false, foreign_key: true
      t.references :seccion, null: false, foreign_key: true

      t.timestamps
    end
  end
end