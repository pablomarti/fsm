class PhysicalConditionsController < ApplicationController
  # GET /physical_conditions
  # GET /physical_conditions.json
  def index
    @physical_conditions = PhysicalCondition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @physical_conditions }
    end
  end

  # GET /physical_conditions/1
  # GET /physical_conditions/1.json
  def show
    @physical_condition = PhysicalCondition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @physical_condition }
    end
  end

  # GET /physical_conditions/new
  # GET /physical_conditions/new.json
  def new
    @physical_condition = PhysicalCondition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @physical_condition }
    end
  end

  # GET /physical_conditions/1/edit
  def edit
    @physical_condition = PhysicalCondition.find(params[:id])
  end

  # POST /physical_conditions
  # POST /physical_conditions.json
  def create
    @physical_condition = PhysicalCondition.new(params[:physical_condition])

    respond_to do |format|
      if @physical_condition.save
        format.html { redirect_to @physical_condition, notice: 'Physical condition was successfully created.' }
        format.json { render json: @physical_condition, status: :created, location: @physical_condition }
      else
        format.html { render action: "new" }
        format.json { render json: @physical_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /physical_conditions/1
  # PUT /physical_conditions/1.json
  def update
    @physical_condition = PhysicalCondition.find(params[:id])

    respond_to do |format|
      if @physical_condition.update_attributes(params[:physical_condition])
        format.html { redirect_to @physical_condition, notice: 'Physical condition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @physical_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /physical_conditions/1
  # DELETE /physical_conditions/1.json
  def destroy
    @physical_condition = PhysicalCondition.find(params[:id])
    @physical_condition.destroy

    respond_to do |format|
      format.html { redirect_to physical_conditions_url }
      format.json { head :no_content }
    end
  end
end
