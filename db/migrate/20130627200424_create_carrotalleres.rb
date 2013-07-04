class CreateCarrotalleres < ActiveRecord::Migration
  def change
    create_table :carrotalleres do |t|
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
    add_index :carrotalleres, :documento_id
    add_index :carrotalleres, :municipio_id
    add_index :carrotalleres, :calificacion_id
  end
end
