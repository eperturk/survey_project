class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :value
      t.integer :survey_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
