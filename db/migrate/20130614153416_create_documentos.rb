class CreateDocumentos < ActiveRecord::Migration
  def change
    create_table :documentos do |t|
      t.string :sigla
      t.string :nombre

      t.timestamps
    end
  end
end
