class AddParentToSecciones < ActiveRecord::Migration[6.1]
  def change
    add_column :secciones, :parent_id, :integer
    add_foreign_key :secciones, :secciones, column: :parent_id
  end
end
