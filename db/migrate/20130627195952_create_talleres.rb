class CreateTalleres < ActiveRecord::Migration
  def change
    create_table :talleres do |t|
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
    add_index :talleres, :documento_id
    add_index :talleres, :municipio_id
    add_index :talleres, :calificacion_id
  end
end
