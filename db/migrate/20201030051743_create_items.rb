class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :price,               null: false
      t.string :name,                 null: false
      t.text :text,                   null: false
      t.integer :category_id,         null: false
      t.integer :detail_id,           null: false
      t.integer :burden_id,           null: false
      t.integer :shipment_source_id,  null: false
      t.integer :number_of_days_id,   null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
