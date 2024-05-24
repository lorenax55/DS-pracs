class RemoveSubseccionesFromSecciones < ActiveRecord::Migration[7.1]
  def change
    remove_column :secciones, :subsecciones, :json
  end
end
