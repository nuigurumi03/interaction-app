class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id, foreign_key: true
      t.string :avater
      t.integer :birthyear,               null: false
      t.integer :birthmonth,              null: false
      t.integer :birthday,                null: false
      t.string :family_name,              null: false
      t.string :personal_name,            null: false
      t.string :family_name_kana,         null: false
      t.string :personal_name_kana,       null: false
      t.string :postal_code,              null: false
      t.string :prefecture,               null: false
      t.string :city,                     null: false
      t.string :address,                  null: false
      t.string :building
      t.integer :tel
      t.string :post_family_name,         null: false
      t.string :post_personal_name,       null: false
      t.string :post_family_name_kana,    null: false
      t.string :post_personal_name_kana,  null: false
      t.string :house_code,               null: false
      t.string :bulid_name

      t.timestamps
    end
  end
end
