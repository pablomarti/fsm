class HumanRecord < ActiveRecord::Base
  
  belongs_to :educational_level
  belongs_to :civil_state
  belongs_to :pregnancy_state
  belongs_to :ocupation
  belongs_to :city
  belongs_to :violence_kind
  belongs_to :system_case
  belongs_to :human

  has_many :human_record_aggressions
  has_many :aggressions,:through=>:human_record_aggressions
  
  attr_accessible :state, :er, :legal_rep_name, :legal_rep_last_name
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
    #start_case

    if er
      make_medical_er
    end
  end

  def self.medical_assistance_list
    where(:state => "medical_assistance").order("er DESC, id ASC")
  end

  #--------Estados----------
  #registration=>Registro de la victima
  #psicological_crisis => Crisis nerviosa al momento de recivir a la victima
  #psicological_atention => Session de escucha Activa
  #medical_atention => Atencion y Diagnostico medico
  #legal_atention => Toma de datos del agresor y procedimiento de acciones legales

  #--------Eventos------------
  #crisis=> paso inmediato de registro a atencion de crisis psicologica en el momento que se recive a la victima si en dado caso esta en crisis
  #victim_stabilized=> Paso de crisis psicologica a escucha activa cuando la victima esta estable osea no esta nerviosa o alterada
  #active_listening=> Session de escucha activa la victima relata su historia y se procede a captar los detalles del hecho y el diagnostico psicologico
  #                   Tambien se procede a hacer el diagnostico psicologico y phsicofisiologico
  #                   Aqui se llena la parte que esta abajo del registro de los datos de la persona
  #heal_injuries=>  Diagnostico y tratamiento medico va despues de la escucha activa
  #                 Por el momento este solo debe ser un put y cambio de estado porque no se posee que informacion se debe suministrar
  #demand=>Procedimientos legales, Aqui se toman los datos del agresor, su relacion con la victima y si procedera a poner demanda o no

  state_machine initial: :registration do
    # Si la victima no esta en crisis nerviosa 
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
