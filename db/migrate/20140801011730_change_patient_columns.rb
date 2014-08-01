class ChangePatientColumns < ActiveRecord::Migration
  def up
    add_column :patients, :first_name, :string
    add_column :patients, :last_name, :string
    add_column :patients, :middle_name, :string
    remove_column :patients, :name
  end

  def down
    remove_column :patients, :first_name
    remove_column :patients, :last_name
    remove_column :patients, :middle_name
    add_column :patients, :name, :string
  end
end
