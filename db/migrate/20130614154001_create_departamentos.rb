class CreateDepartamentos < ActiveRecord::Migration
  def change
    create_table :departamentos do |t|
      t.string :nombre
      t.string :sigla
      t.references :pais

      t.timestamps
    end
    add_index :departamentos, :pais_id
  end
end
