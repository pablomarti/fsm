class EmotionalConditionsController < ApplicationController
  # GET /emotional_conditions
  # GET /emotional_conditions.json
  def index
    @emotional_conditions = EmotionalCondition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @emotional_conditions }
    end
  end

  # GET /emotional_conditions/1
  # GET /emotional_conditions/1.json
  def show
    @emotional_condition = EmotionalCondition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @emotional_condition }
    end
  end

  # GET /emotional_conditions/new
  # GET /emotional_conditions/new.json
  def new
    @emotional_condition = EmotionalCondition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @emotional_condition }
    end
  end

  # GET /emotional_conditions/1/edit
  def edit
    @emotional_condition = EmotionalCondition.find(params[:id])
  end

  # POST /emotional_conditions
  # POST /emotional_conditions.json
  def create
    @emotional_condition = EmotionalCondition.new(params[:emotional_condition])

    respond_to do |format|
      if @emotional_condition.save
        format.html { redirect_to @emotional_condition, notice: 'Emotional condition was successfully created.' }
        format.json { render json: @emotional_condition, status: :created, location: @emotional_condition }
      else
        format.html { render action: "new" }
        format.json { render json: @emotional_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /emotional_conditions/1
  # PUT /emotional_conditions/1.json
  def update
    @emotional_condition = EmotionalCondition.find(params[:id])

    respond_to do |format|
      if @emotional_condition.update_attributes(params[:emotional_condition])
        format.html { redirect_to @emotional_condition, notice: 'Emotional condition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @emotional_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emotional_conditions/1
  # DELETE /emotional_conditions/1.json
  def destroy
    @emotional_condition = EmotionalCondition.find(params[:id])
    @emotional_condition.destroy

    respond_to do |format|
      format.html { redirect_to emotional_conditions_url }
      format.json { head :no_content }
    end
  end
end
