class SystemCase < ActiveRecord::Base
  
  belongs_to :city
  belongs_to :zone_kind
  has_many :human_records
  has_many :humen, :through => :human_records

  attr_accessible :aggression_date, :complaint, :recidivism
  attr_accessible :city_id, :zone_kind_id
  attr_accessible :human_records_attributes

  accepts_nested_attributes_for :human_records, allow_destroy: true
  
end
