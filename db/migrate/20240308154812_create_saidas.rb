class CreateSaidas < ActiveRecord::Migration[7.1]
  def change
    create_table :saidas do |t|
      t.string :nfc
      t.date :data
      t.string :nome
      t.float :valor
      t.timestamps
    end
  end
end
