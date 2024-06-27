# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price, default: 0.0
      t.decimal :tax_rate, default: 0.0
      t.decimal :discount_rate, default: 0.0
      t.integer :quantity_avaliable, default: 0

      t.timestamps
    end
  end
end
