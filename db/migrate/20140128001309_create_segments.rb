class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.string :name
      t.text :content
      t.integer :sequence
      t.integer :note_id

      t.timestamps
    end
  end
end
