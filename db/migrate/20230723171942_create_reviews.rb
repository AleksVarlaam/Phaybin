class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text   :message
      t.string :avatar

      t.timestamps
    end
  end
end
