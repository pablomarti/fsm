class SystemCase < ActiveRecord::Base
  
  belongs_to :city
  belongs_to :zone_kind
  has_many :human_records
  has_many :humen, :through => :human_records
  has_many :aggressors, :through => :human_records

  attr_accessible :aggression_date, :complaint, :recidivism
  attr_accessible :city_id, :zone_kind_id
  attr_accessible :human_records_attributes
  attr_accessible :aggressors_attributes

  accepts_nested_attributes_for :human_records, allow_destroy: true
  accepts_nested_attributes_for :aggressors, allow_destroy: true

  ########################################### QUERIES

  #Victimas agredidas por departamento
  def self.aggressions_by_state
    select("states.name AS label, COUNT(human_records.id) AS total, human_records.violence_kind_id")
    .joins({:city => :state}, :human_records)
    .group("states.id")
    .having(:human_records => {:violence_kind_id => 1})
  end

  #Victimas agredidas por municipio
  def self.aggressions_by_city
  end

  #Victimas agredidas por edad
  def self.aggressions_by_age
    select("humen.age AS label, COUNT(human_records.id) AS total, human_records.violence_kind_id")
    .joins(:human_records => :human)
    .group("humen.age")
    .having(:human_records => {:violence_kind_id => 1})
  end

  #Victimas agredidas por edad en cada departamento
  def self.aggressions_by_state_and_age
    select("humen.age AS label, states.name AS label2, COUNT(human_records.id) AS total, human_records.violence_kind_id")
    .joins({:human_records => :human}, {:city => :state})
    .group("states.id, humen.age")
    .having(:human_records => {:violence_kind_id => 1})
  end

  #Victimas agredidas por edad en cada municipio
  def self.aggressions_by_city_and_age
  end

  #Victimas agredidas por cada mes
  def self.aggressions_by_month
  end

  #Victimas agredidas por dias de la semana
  def self.aggressions_by_weekdays
  end
  
end