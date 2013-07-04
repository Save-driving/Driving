class CreateConductores < ActiveRecord::Migration
  def change
    create_table :conductores do |t|
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
    add_index :conductores, :documento_id
    add_index :conductores, :municipio_id
    add_index :conductores, :calificacion_id
  end
end
