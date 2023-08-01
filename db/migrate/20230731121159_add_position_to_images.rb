class AddPositionToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :position, :integer
    Gallery.all.each do |gallery|
      gallery.images.order(:updated_at).each.with_index(1) do |image, index|
        image.update_column :position, index
      end
    end
  end
end
