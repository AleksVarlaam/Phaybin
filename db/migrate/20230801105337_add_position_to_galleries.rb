class AddPositionToGalleries < ActiveRecord::Migration[7.0]
  def change
    add_column :galleries, :position, :integer
    Gallery.order(:updated_at).each.with_index(1) do |gallery, index|
      gallery.update_column :position, index
    end
  end
end
