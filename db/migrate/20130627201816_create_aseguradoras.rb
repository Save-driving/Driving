class CreateAseguradoras < ActiveRecord::Migration
  def change
    create_table :aseguradoras do |t|
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
    add_index :aseguradoras, :documento_id
    add_index :aseguradoras, :municipio_id
    add_index :aseguradoras, :calificacion_id
  end
end
