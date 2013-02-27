class HumanRecord < ActiveRecord::Base
  
  belongs_to :educational_level
  belongs_to :civil_state
  belongs_to :pregnancy_state
  belongs_to :ocupation
  belongs_to :city
  belongs_to :violence_kind
  belongs_to :system_case
  belongs_to :human
  
  attr_accessible :state, :er 
  attr_accessible :educational_level_id, :civil_state_id, :pregnancy_state_id, :ocupation_id, :city_id, :violence_kind_id, :system_case_id, :human_id
  attr_accessible :name, :last_name, :sex

  attr_accessor :name, :last_name, :sex

  before_create :create_human
  after_create :start_process

  def create_human
    h = Human.new(:name => name, :last_name => last_name, :sex => sex)
    h.save
    self.human_id = h.id
  end

  def start_process
    start_case

    if er
      make_medical_er
    end
  end

  def self.medical_assistance_list
    where(:state => "medical_assistance").order("er DESC, id ASC")
  end

  state_machine initial: :registration do
    event :crisis do
      transition :registration => :psicological_crisis   
    end

    event :victim_stabilized do
      transition  :psicological_crisis => :psicological_atention  
    end

    event :active_listening do        
      transition :registration => :psicological_atention   
    end
    
    event :heal_injuries do  
      transition :psicological_atention => :medical_atention
    end 
    
    event :demand do   
      transition :medical_atention => :legal_atention 
    end   
  end

end
