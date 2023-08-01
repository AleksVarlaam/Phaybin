class AddPositionToGalleries < ActiveRecord::Migration[7.0]
  def change
    add_column :galleries, :position, :integer, null: false, default: 1
  end
end
