class User < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 150, null: false
      t.string :email, limit: 100, null: false
      t.string :password_digest, limit: 255, null: false
      t.string :phone, limit: 30
      t.string :nikename, limit: 255
      t.text :image
      t.string :provider, default: 'email', null: false
      t.string :uid, default: '', null: false
      t.string :reset_password_token, limit: 255
      t.datetime :reset_password_sent_at, precision: 6
      t.boolean :allow_password_change, default: false
      t.datetime :remember_created_at, precision: 6
      t.string :confirmation_token, limit: 255
      t.datetime :confirmed_at, precision: 6
      t.datetime :confirmation_sent_at, precision: 6
      t.string :unconfirmed_email, limit: 255
      t.text :tokens
      t.integer :status, null: false
      t.string :slug, limit: 255, null: false, charset: :ucs2

      t.timestamps
    end

    add_index :users, :slug, unique: true, name: 'slug'
  end
end
