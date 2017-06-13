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

ActiveRecord::Schema.define(version: 20170613180355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "cadastros", force: :cascade do |t|
    t.integer  "id_cliente_coelce"
    t.integer  "digito_verificador_cliente_coelce"
    t.integer  "codigo_ocorrencia"
    t.date     "data_ocorrencia"
    t.float    "valor"
    t.integer  "parcelas"
    t.text     "livre"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_cadastros_on_user_id", using: :btree
  end

  create_table "cadastros_relatorios", force: :cascade do |t|
    t.integer  "id_cliente_coelce"
    t.integer  "digito_verificador_cliente_coelce"
    t.integer  "codigo_ocorrencia"
    t.date     "data_ocorrencia"
    t.float    "valor"
    t.integer  "parcelas"
    t.text     "livre"
    t.integer  "relatorio_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "cadastro_id"
    t.index ["relatorio_id"], name: "index_cadastros_relatorios_on_relatorio_id", using: :btree
  end

  create_table "instituicos", force: :cascade do |t|
    t.string   "nome_instituicao"
    t.integer  "id_cliente_parceira"
    t.integer  "codigo_produto"
    t.integer  "codigo_empresa_parceira"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "relatorios", force: :cascade do |t|
    t.date     "data_inicio"
    t.date     "data_final"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "file_name"
    t.float    "valor_total"
    t.integer  "registro_total"
    t.string   "registroA"
    t.text     "registroD"
    t.string   "registroZ"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.integer  "role",                   default: 0
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "cadastros_relatorios", "relatorios"
end
