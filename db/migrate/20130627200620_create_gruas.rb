class CreateGruas < ActiveRecord::Migration
  def change
    create_table :gruas do |t|
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
    add_index :gruas, :documento_id
    add_index :gruas, :municipio_id
    add_index :gruas, :calificacion_id
  end
end
