class CreatePaises < ActiveRecord::Migration
  def change
    create_table :paises do |t|
      t.string :sigla
      t.string :nombre

      t.timestamps
    end
  end
end
