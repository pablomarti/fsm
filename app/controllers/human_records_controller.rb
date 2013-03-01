class HumanRecordsController < ApplicationController
  
  def index
    if can? :read, HumanRecord
      @human_records = current_user.get_cases

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
    @human_record = HumanRecord.find(params[:id])
  	@system_case = @human_record.system_case
    @aggressions_list = Aggression.grouped_by_kind
  end

  def active_listening_perform
    params[:human_record][:agressions].delete("") if params[:human_record] and params[:human_record][:agressions]
    params[:human_record][:diagnosis][:emotional_conditions].delete("") if params[:human_record] and params[:human_record][:diagnoses] and params[:human_record][:diagnoses][:emotional_conditions]
    params[:human_record][:diagnosis][:psycho_physio_alterations].delete("") if params[:human_record] and params[:human_record][:diagnosis] and params[:human_record][:diagnosis][:psycho_physio_alterations]
    diagnosis_params =  params[:human_record].delete(:diagnosis)
    @diagnosis = Diagnosis.new(diagnosis_params) if !diagnosis_params.nil?
    @human_record = HumanRecord.find(params[:id])
    @system_case = @human_record.system_case
    ActiveRecord::Base.transaction do
      saved = @diagnosis ? @diagnosis.save : false
      if saved
        puts "guardo nuevo diagnosis"
        @human_record.diagnosis = @diagnosis
        saved = @human_record.save
        if saved
          saved = @human_record.can_heal_injuries?
          if saved 
            saved = @system_case.update_attributes(params[:system_case]) 
            if saved
              saved = @human_record.update_attributes(params[:human_record]) 
              if !saved
                @fail_type = "human_record_update"
              end
            else
              @fail_type = "system_case_update"
            end
          else
            @fail_type = "state"
          end
        else
          @fail_type = "human_record_diagnosis"
        end
      else
        puts "no guardo nuevo diagnosis"
        @fail_type = "diagnosis"
      end

      if saved
        @human_record.heal_injuries
        respond_to do |format|
          format.html { redirect_to human_records_path, notice: 'La victima fue remitida a tratamiento medico existosamente' }
        end
        return
      else
        raise ActiveRecord::Rollback
      end
    end
    puts @fail_type
    if @fail_type !="state"
      @aggressions_list = Aggression.grouped_by_kind  
      respond_to do |format|
        format.html { render action: "active_listening" }
      end
    else
      respond_to do |format|
        format.html { redirect_to human_records_path, notice: 'La victima ya fue remitida a tratamiento medico' }
      end
    end
    
  end

  def heal_injuries
  	@human_record = HumanRecord.find(params[:id])
  	if @human_record.can_demand?
  		@human_record.demand
  		msg = 'La victima fue remitida con el trabajador social para asistencia legal en su caso'
  	else
  		msg = 'La victima no se pudo remitir el trabajador social'
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
    @violence_kinds = ViolenceKind.all_except_victim.order("name ASC")
    @human_conditions = HumanCondition.order("name ASC")
    @weapons = WeaponKind.order("name ASC")
  end

  def demand_perform
    #@human_record = HumanRecord.find(params[:id])
    #@system_case = @human_record.system_case
    @system_case = SystemCase.find(params[:id])

    @human_record = HumanRecord.find(params[:human_record_id])
    @human_record.end_and_follow

    if @system_case.update_attributes(params[:system_case])
      redirect_to actual_status_human_record_path(@human_record.id)
      #redirect_to human_records_path, :notice => "La asistencia legal ha sido guardada"
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
    @human_records = @system_case.human_records.where("id <> ?", @human_record.id)
  end

end
