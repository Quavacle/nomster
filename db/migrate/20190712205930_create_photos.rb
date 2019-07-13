class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
        t.text :caption
        t.integer :place_id
      t.timestamps
    end

    add_index :caption, :place_id
  end
end
