class Human < ActiveRecord::Base
  
  has_many :human_records
  has_many :system_cases, :through => :human_records
  has_many :human_documents

  attr_accessible :birthdate, :last_name, :name, :sex, :total_daughters, :total_sons, :age

  def full_name
  	name.to_s + " " + last_name.to_s
  end

  def sex_name
  	sex ? "Femenino" : "Masculino"
  end

end
