class CreateEntradas < ActiveRecord::Migration[7.1]
  def change
    create_table :entradas do |t|
      t.string :numero_recibo
      t.date :data
      t.string :nome
      t.string :descricao
      t.float :valor
      t.references :congregacao, foreign_key: true
      t.timestamps
    end
  end
end
