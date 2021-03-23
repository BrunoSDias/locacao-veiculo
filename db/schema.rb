# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_23_001352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "administradors", force: :cascade do |t|
    t.string "nome"
    t.string "login"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hash_senha"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "cep"
    t.string "estado"
    t.string "rua"
    t.string "numero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marcas", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservas", force: :cascade do |t|
    t.bigint "veiculo_id"
    t.integer "tempo_de_espera"
    t.decimal "valor_alugado"
    t.datetime "reservado_de"
    t.datetime "reservado_ate"
    t.boolean "pagamento_no_destino"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.bigint "usuario_id"
    t.index ["usuario_id"], name: "index_reservas_on_usuario_id"
    t.index ["veiculo_id"], name: "index_reservas_on_veiculo_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "endereco"
    t.integer "numero"
    t.string "cep"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "login"
    t.string "senha"
    t.string "cidade"
    t.string "complemento"
    t.datetime "data_nascimento"
    t.string "bairro"
    t.string "hash_senha"
    t.string "senha_hash"
  end

  create_table "veiculos", force: :cascade do |t|
    t.string "nome"
    t.string "cor"
    t.integer "qnt_passageiros"
    t.string "placa"
    t.decimal "valor"
    t.bigint "marca_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marca_id"], name: "index_veiculos_on_marca_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "reservas", "usuarios"
  add_foreign_key "reservas", "veiculos"
  add_foreign_key "veiculos", "marcas"
end
