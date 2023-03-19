# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :ru, null: false
      t.string :uk, null: false
      t.string :en, null: false
      t.string :he, null: false

      t.timestamps
    end
  end
end
