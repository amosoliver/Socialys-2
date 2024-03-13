class CreateLiteraturas < ActiveRecord::Migration[7.1]
  def change
    create_table :literaturas do |t|
      t.float :valor
      t.references :congregacao, foreign_key: true  
      t.timestamps
    end
  end
end
