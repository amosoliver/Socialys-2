# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_11_121423) do
  create_table "congregacoes", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entradas", force: :cascade do |t|
    t.string "numero_recibo"
    t.date "data"
    t.string "nome"
    t.string "descricao"
    t.float "valor"
    t.integer "congregacao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["congregacao_id"], name: "index_entradas_on_congregacao_id"
  end

  create_table "literaturas", force: :cascade do |t|
    t.float "valor"
    t.integer "congregacao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["congregacao_id"], name: "index_literaturas_on_congregacao_id"
  end

  create_table "saidas", force: :cascade do |t|
    t.string "nfc"
    t.date "data"
    t.string "nome"
    t.float "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "entradas", "congregacoes"
  add_foreign_key "literaturas", "congregacoes"
end
