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
  attr_accessible :name, :last_name, :sex, :age

  attr_accessor :name, :last_name, :sex, :age

  before_create :create_human
  after_create :start_process

  def create_human
    h = Human.new(:name => name, :last_name => last_name, :sex => sex, :age => age)
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

  state_machine initial: :appearance do
    event :start_case do
      transition :appearance => :new_case
    end

    event :make_medical_er do #ER
    	transition :new_case => :medical_assistance
    end

    event :send_er_to_follow_case do #ER
    	transition :medical_assistance => :conversation
    end

    event :follow_case do
    	transition :new_case => :conversation
    end

    event :give_medical_assistance do
      transition :conversation => :medical_assistance
    end

    event :give_diagnosis do
      transition :medical_assistance => :diagnosis
    end

    event :give_legal_assistance do
      transition :diagnosis => :legal_assistance
    end
  end

end
