# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :proirity
      t.boolean :completed
      t.references :todo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
