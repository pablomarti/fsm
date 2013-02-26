class SystemCase < ActiveRecord::Base
  
  belongs_to :city
  belongs_to :zone_kind

  attr_accessible :aggression_date, :complaint, :recidivism, :state, :emergency
  attr_accessible :city_id, :zone_kind_id

  #ESTO ESTARA DENTRO DEL RECORD DE UNA PERSONA
  state_machine initial: :incomplete do
    event :start_case do
      transition :incomplete => :new_case
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
