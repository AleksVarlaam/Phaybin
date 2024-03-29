# frozen_string_literal: true

class CreateGalleries < ActiveRecord::Migration[7.0]
  def change
    create_table :galleries do |t|
      t.string :ru, null: false
      t.string :uk, null: false
      t.string :en, null: false
      t.string :he, null: false
      t.string :cover_mobile
      t.string :cover_desktop

      t.timestamps
    end
  end
end
