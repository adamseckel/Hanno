class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.references :project, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
