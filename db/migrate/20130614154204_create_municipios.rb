class CreateMunicipios < ActiveRecord::Migration
  def change
    create_table :municipios do |t|
      t.string :nombre
      t.references :departamento

      t.timestamps
    end
    add_index :municipios, :departamento_id
  end
end
