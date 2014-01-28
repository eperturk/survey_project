class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :gender
      t.date :dob
      t.string :doctor

      t.timestamps
    end
  end
end
