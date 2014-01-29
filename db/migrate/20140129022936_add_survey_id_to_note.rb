class AddSurveyIdToNote < ActiveRecord::Migration
  def change
    add_column :notes, :survey_id, :integer
  end
end
