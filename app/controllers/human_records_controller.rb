class HumanRecordsController < ApplicationController
  
  def index
  end

  def victim_stabilized
  	@human_record = HumanRecord.find(params[:id])
  	if @human_record.can_victim_stabilized?
  		@human_record.victim_stabilized
  		msg = 'La victima fue remitida a escucha activa'
  	else
  		msg = 'La victima no se pudo remitir a escucha activa'
  	end
  	respond_to do |format|
  		format.html{ redirect_to human_records_path,  notice: msg}
  		format.json{render json: {notice: msg}, status: :created, location: @human_record}
  	end
  end

  def active_listening
    @human_record = HumanRecord.find(params[:id])
  	@system_case = @human_record.system_case
    @aggressions_list = Aggression.grouped_by_kind
  end

  def active_listening_perform
    params[:human_record][:agressions].delete("") if params[:human_record] and params[:human_record][:agressions]
    params[:human_record][:diagnoses][:emotional_conditions].delete("") if params[:human_record] and params[:human_record][:diagnoses] and params[:human_record][:diagnoses][:emotional_conditions]
    params[:human_record][:diagnoses][:psycho_physio_alterations].delete("") if params[:human_record] and params[:human_record][:diagnoses] and params[:human_record][:diagnoses][:psycho_physio_alterations]
    @human_record = HumanRecord.find(params[:id])
    @system_case = @human_record.system_case
    saved = @human_record.can_heal_injuries?
    ActiveRecord::Base.transaction do
      saved = saved and @system_case.update_attributes(params[:system_case]) and @human_record.update_attributes(params[:human_record]) 
      if saved
        @human_record.heal_injuries
        respond_to do |format|
          format.html { redirect_to human_records_path, notice: 'La victima fue remitida a tratamiento medico existosamente' }
        end
      else
        raise ActiveRecord::Rollback if @human_record.can_heal_injuries?
        respond_to do |format|
          @aggressions_list = Aggression.grouped_by_kind  
          format.html { render action: "active_listening" }
        end
      end
    end
  end

  def heal_injuries
  	@human_record = HumanRecord.find(params[:id])
  	if @human_record.can_heal_injuries?
  		@human_record.victim_stabilized
  		msg = 'La victima fue remitida a atencion medica para su diagnostico y tratamiento'
  	else
  		msg = 'La victima no se pudo remitir a atencion medica'
  	end
  	respond_to do |format|
  		format.html{ redirect_to human_records_path,  notice: msg}
  		format.json{render json: {notice: msg}, status: :created, location: @human_record}
  	end
  end

  def demand
    human_record = HumanRecord.find(params[:id])
    @system_case = human_record.system_case
    #@system_case = SystemCase.new
    #@system_case.human_records.build
    @system_case.aggressors.build

    @educational_levels = EducationalLevel.order("name ASC")
    @civil_states = CivilState.order("name ASC")
    @ocupations = Ocupation.order("name ASC")
    @cities = City.order("name ASC")
    @violence_kinds = ViolenceKind.order("name ASC")
    @human_conditions = HumanCondition.order("name ASC")
  end

  def demand_perform
    redirect_to demand_human_record_path(params[:id])
  end

end
