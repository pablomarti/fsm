class Aggressor < ActiveRecord::Base
  
  belongs_to :human_record
  belongs_to :physical_condition
  has_many :aggressor_human_conditions  
  has_many :weapons
  has_many :human_conditions, :through => :aggressor_human_conditions
  has_many :weapon_kinds, :through => :weapons
  
  attr_accessible :aftermath_war, :prior_criminal, :sexual_assault_antecedent, :violence_witness
  attr_accessible :human_record_id, :physical_condition_id
  attr_accessible :name, :last_name, :sex, :age
  attr_accessible :educational_level_id, :civil_state_id, :ocupation_id, :city_id, :violence_kind_id
  attr_accessible :aggressor_human_conditions_attributes
  attr_accessible :weapons_attributes
  attr_accessible :human_condition_aux, :weapon_aux

  accepts_nested_attributes_for :aggressor_human_conditions, allow_destroy: true
  accepts_nested_attributes_for :weapons, allow_destroy: true

  #Human
  attr_accessor :name, :last_name, :sex, :age
  
  #Human Record
  attr_accessor :educational_level_id, :civil_state_id, :ocupation_id, :city_id, :violence_kind_id

  #Form auxiliars for tags
  attr_accessor :human_condition_aux, :weapon_aux

  #before_create :create_human
  after_save :save_tags

  def create_human
    h = Human.new(name: name, last_name: last_name, sex: sex, age: age)
    h.save

    hr = HumanRecord.new(educational_level_id: educational_level_id, civil_state_id: civil_state_id, ocupation_id: ocupation_id, city_id: city_id, violence_kind_id: violence_kind_id)
    hr.human_id = h.id
    hr.save

    self.human_record_id = hr.id
  end

  def save_tags
    weapons.destroy_all
    aggressor_human_conditions.destroy_all

    human_condition_aux.map{ |item|
      if item != "" && !HumanCondition.find(item).nil?
        aggressor_human_conditions << AggressorHumanCondition.new(human_condition_id: item.to_i)
      end
    }

    weapon_aux.map{ |item|
      if item != "" && !WeaponKind.find(item).nil?
        weapons << Weapon.new(weapon_kind_id: item.to_i)
      end
    }
  end

end
