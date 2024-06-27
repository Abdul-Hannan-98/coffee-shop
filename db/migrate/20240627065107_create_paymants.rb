# frozen_string_literal: true

class CreatePaymants < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.decimal :amount, default: 0.0
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
