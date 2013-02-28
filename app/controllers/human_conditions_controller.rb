class HumanConditionsController < ApplicationController
  # GET /human_conditions
  # GET /human_conditions.json
  def index
    @human_conditions = HumanCondition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @human_conditions }
    end
  end

  # GET /human_conditions/1
  # GET /human_conditions/1.json
  def show
    @human_condition = HumanCondition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @human_condition }
    end
  end

  # GET /human_conditions/new
  # GET /human_conditions/new.json
  def new
    @human_condition = HumanCondition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @human_condition }
    end
  end

  # GET /human_conditions/1/edit
  def edit
    @human_condition = HumanCondition.find(params[:id])
  end

  # POST /human_conditions
  # POST /human_conditions.json
  def create
    @human_condition = HumanCondition.new(params[:human_condition])

    respond_to do |format|
      if @human_condition.save
        format.html { redirect_to @human_condition, notice: 'Human condition was successfully created.' }
        format.json { render json: @human_condition, status: :created, location: @human_condition }
      else
        format.html { render action: "new" }
        format.json { render json: @human_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /human_conditions/1
  # PUT /human_conditions/1.json
  def update
    @human_condition = HumanCondition.find(params[:id])

    respond_to do |format|
      if @human_condition.update_attributes(params[:human_condition])
        format.html { redirect_to @human_condition, notice: 'Human condition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @human_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /human_conditions/1
  # DELETE /human_conditions/1.json
  def destroy
    @human_condition = HumanCondition.find(params[:id])
    @human_condition.destroy

    respond_to do |format|
      format.html { redirect_to human_conditions_url }
      format.json { head :no_content }
    end
  end
end
