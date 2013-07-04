class CreateAbogados < ActiveRecord::Migration
  def change
    create_table :abogados do |t|
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
    add_index :abogados, :documento_id
    add_index :abogados, :municipio_id
    add_index :abogados, :calificacion_id
  end
end
