class CreateAmbulancias < ActiveRecord::Migration
  def change
    create_table :ambulancias do |t|
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
    add_index :ambulancias, :documento_id
    add_index :ambulancias, :municipio_id
    add_index :ambulancias, :calificacion_id
  end
end
