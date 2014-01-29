class AddNamesToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :first_name, :string
    add_column :patients, :last_name, :string
    add_column :patients, :middle_name, :string
    remove_column :patients, :name, :string
  end
end
