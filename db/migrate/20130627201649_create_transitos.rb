class CreateTransitos < ActiveRecord::Migration
  def change
    create_table :transitos do |t|
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
    add_index :transitos, :documento_id
    add_index :transitos, :municipio_id
    add_index :transitos, :calificacion_id
  end
end
