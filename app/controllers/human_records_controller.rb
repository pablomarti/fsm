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
    #@system_case = human_record.system_case
    @system_case = SystemCase.new
    @system_case.human_records.build
  end

  def demand_perform
    redirect_to demand_human_record_path(params[:id])
  end

end
