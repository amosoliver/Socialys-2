class CreateCongregacoes < ActiveRecord::Migration[7.1]
  def change
    create_table :congregacoes do |t|
      t.string :nome
      t.timestamps
    end
  end
end
