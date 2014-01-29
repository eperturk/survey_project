class Segment < ActiveRecord::Base
  attr_accessible :content, :name, :note_id, :sequence
  belongs_to :note

  def populate_variables(response_set,patient)
    patient_hash = patient.generate_patient_hash
    response_set = Response.find(response_set)
    response_hash = JSON.parse(response_set.value)
    answer_response_hash = {}
    response_hash.keys.each_with_index do |question,i|
      q_number = i+1
      if response_hash[question].class == String
        answer_response_hash["!!ANSWER_#{q_number}!!"] = response_hash[question]
      elsif response_hash[question].class == Array && response_hash[question].count == 2
        answer_response_hash["!!ANSWER_#{q_number}!!"] = response_hash[question].join(" and ")
      else
        answer_response_hash["!!ANSWER_#{q_number}!!"] = response_hash[question].join(", ")
      end
    end
    original_text = content
    patient_hash.each {|answer,patient| original_text.gsub!(answer,patient)}
    answer_response_hash.each {|answer,response| original_text.gsub!(answer,response)}
    return original_text
  end

end
