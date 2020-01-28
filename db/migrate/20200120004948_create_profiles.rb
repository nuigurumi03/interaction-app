class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id,            foreign_key: true
      t.integer :birthyear,          null: false
      t.integer :birthmonth,         null: false
      t.integer :birthday,           null: false
      t.string  :family_name,        null: false
      t.string  :personal_name,      null: false
      t.string  :family_name_kana,   null: false
      t.string  :personal_name_kana, null: false
      t.string  :postal_code,        null: false
      t.integer :prefecture_id,      null: false
      t.string  :city,               null: false
      t.string  :tel,                null: false
      t.string  :house_code,         null: false
      t.string  :bulid_name,         null: false

      t.timestamps
    end
  end
end
