class Aggression < ActiveRecord::Base
  
  belongs_to :aggression_kind
  belongs_to :system_case
  has_many :human_record_aggressions
  has_many :human_records, :through=>:human_record_aggressions
  
  attr_accessible :name, :aggression_kind_id


  def self.grouped_by_kind
    hash = Hash.new
    Aggression.all.each do |aggression|
      key = aggression.aggression_kind.name.downcase.gsub(" ", "_").to_sym
    	if !hash.has_key?(key)
        	hash[key]=[aggression]
      	else
        	hash[key] << aggression
      	end
    end
    return hash
  end
end
