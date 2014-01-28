class Segment < ActiveRecord::Base
  attr_accessible :content, :name, :note_id, :sequence
  belongs_to :note
end
