class CreateSecciones < ActiveRecord::Migration[7.1]
  def change
    create_table :secciones do |t|
      t.string :nombre
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
