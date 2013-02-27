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
  		format.html{ redirect_to human_records_path,  notice: }
  		format.json{render json: {notice: 'La victima fue remitida a escucha activa'}, status: :created, location: @human_record}
  	end
  end

  def active_listening
  end

  def heal_injuries
  end

  def demand
  end
end
