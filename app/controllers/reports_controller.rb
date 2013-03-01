class ReportsController < ApplicationController
  
  def index
  	#@data = get_report("aggressions_by_state")
  	#@data = get_report("aggressions_by_age")
  	@data = get_report("aggressions_by_state_and_age")
  end

  def load_new_report
  	@data = get_report(params[:report])
  end

  def get_report(kind)
  	data = case kind
  		when "aggressions_by_state"
  			SystemCase.aggressions_by_state
  		when "aggressions_by_city"
  			SystemCase.aggressions_by_city
  		when "aggressions_by_age"
  			SystemCase.aggressions_by_age
  		when "aggressions_by_state_and_age"
  			SystemCase.aggressions_by_state_and_age
  		when "aggressions_by_city_and_age"
  			SystemCase.aggressions_by_city_and_age
  		when "aggressions_by_month"
  			SystemCase.aggressions_by_month
  		when "aggressions_by_weekdays"
  			SystemCase.aggressions_by_weekdays  		
  	end

  	return data
  end

end
