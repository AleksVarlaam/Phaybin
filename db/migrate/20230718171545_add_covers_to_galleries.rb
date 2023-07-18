class AddCoversToGalleries < ActiveRecord::Migration[7.0]
  def change
    add_column :galleries, :cover_mobile, :string
    add_column :galleries, :cover_desktop, :string
  end
end
