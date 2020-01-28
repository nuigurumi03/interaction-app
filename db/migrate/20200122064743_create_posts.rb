class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer  :user_id,       foreign_key: true
      t.string   :title,         null: false
      t.text     :detail,        null: false
      t.integer  :prefecture_id, null: false
      t.string   :city,          null: false
      t.string   :house_code
      t.string   :build_name

      t.timestamps
    end
  end
end
