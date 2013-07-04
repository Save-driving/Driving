class CreateParqueaderos < ActiveRecord::Migration
  def change
    create_table :parqueaderos do |t|
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
    add_index :parqueaderos, :documento_id
    add_index :parqueaderos, :municipio_id
    add_index :parqueaderos, :calificacion_id
  end
end
