class HumanRecordsController < ApplicationController
  
  def index
    if can? :read, HumanRecord
      @human_records = current_user.get_active_cases

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @human_records }
      end
    else
      redirect_to root_url
    end
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
    @human_record = HumanRecord.find(params[:id])
    @system_case = @human_record.system_case
    @system_case.human_records.build

    #@educational_levels = EducationalLevel.order("name ASC")
    #@civil_states = CivilState.order("name ASC")
    #@ocupations = Ocupation.order("name ASC")
    #@cities = City.order("name ASC")
    #@violence_kinds = ViolenceKind.order("name ASC")
    @human_conditions = HumanCondition.order("name ASC")
    @weapons = WeaponKind.order("name ASC")
  end

  def demand_perform
    #@human_record = HumanRecord.find(params[:id])
    #@system_case = @human_record.system_case
    @system_case = SystemCase.find(params[:id])

    if @system_case.update_attributes(params[:system_case])
      redirect_to actual_status_human_record_path(params[:id])
    else
      respond_to do |format|
        format.html { render action: "demand" }
        format.json { render json: @system_case.errors, status: :unprocessable_entity }
      end
    end    
  end

  def actual_status
    @human_record = HumanRecord.find(params[:id])
    @system_case = @human_record.system_case
  end

end
