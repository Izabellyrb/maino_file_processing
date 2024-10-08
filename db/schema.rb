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

ActiveRecord::Schema[7.1].define(version: 2024_08_28_235501) do
  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "invoices", force: :cascade do |t|
    t.string "serie"
    t.string "invoice_number"
    t.datetime "invoice_date"
    t.integer "sender_id", null: false
    t.integer "recipient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["recipient_id"], name: "index_invoices_on_recipient_id"
    t.index ["sender_id"], name: "index_invoices_on_sender_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "ncm"
    t.string "cfop"
    t.string "unit_com"
    t.decimal "quantity_com", precision: 10, scale: 2
    t.decimal "total_amount", precision: 10, scale: 2
    t.decimal "icms", precision: 15, scale: 2
    t.decimal "ipi", precision: 15, scale: 2
    t.decimal "pis", precision: 15, scale: 2
    t.decimal "cofins", precision: 15, scale: 2
    t.integer "invoice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_products_on_invoice_id"
  end

  create_table "recipients", force: :cascade do |t|
    t.string "document"
    t.string "name"
    t.string "address"
    t.string "address_number"
    t.string "address_complement"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "cep"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "senders", force: :cascade do |t|
    t.string "document"
    t.string "name"
    t.string "address"
    t.string "address_number"
    t.string "address_complement"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "cep"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "invoices", "recipients"
  add_foreign_key "invoices", "senders"
  add_foreign_key "products", "invoices"
end
