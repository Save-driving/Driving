class CreateDesplazamientos < ActiveRecord::Migration
  def change
    create_table :desplazamientos do |t|
      t.references :documento
      t.string :numero_doc
      t.string :nombres
      t.string :direccion
      t.references :municipio
      t.string :telefonos
      t.string :email
      t.references :calificacion
      t.text :observaciones

      t.timestamps
    end
    add_index :desplazamientos, :documento_id
    add_index :desplazamientos, :municipio_id
    add_index :desplazamientos, :calificacion_id
  end
end
