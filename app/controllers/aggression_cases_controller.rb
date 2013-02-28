class AggressionCasesController < ApplicationController
  # GET /aggression_cases
  # GET /aggression_cases.json
  def index
    @aggression_cases = AggressionCase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aggression_cases }
    end
  end

  # GET /aggression_cases/1
  # GET /aggression_cases/1.json
  def show
    @aggression_case = AggressionCase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aggression_case }
    end
  end

  # GET /aggression_cases/new
  # GET /aggression_cases/new.json
  def new
    @aggression_case = AggressionCase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @aggression_case }
    end
  end

  # GET /aggression_cases/1/edit
  def edit
    @aggression_case = AggressionCase.find(params[:id])
  end

  # POST /aggression_cases
  # POST /aggression_cases.json
  def create
    @aggression_case = AggressionCase.new(params[:aggression_case])

    respond_to do |format|
      if @aggression_case.save
        format.html { redirect_to @aggression_case, notice: 'Aggression case was successfully created.' }
        format.json { render json: @aggression_case, status: :created, location: @aggression_case }
      else
        format.html { render action: "new" }
        format.json { render json: @aggression_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aggression_cases/1
  # PUT /aggression_cases/1.json
  def update
    @aggression_case = AggressionCase.find(params[:id])

    respond_to do |format|
      if @aggression_case.update_attributes(params[:aggression_case])
        format.html { redirect_to @aggression_case, notice: 'Aggression case was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aggression_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aggression_cases/1
  # DELETE /aggression_cases/1.json
  def destroy
    @aggression_case = AggressionCase.find(params[:id])
    @aggression_case.destroy

    respond_to do |format|
      format.html { redirect_to aggression_cases_url }
      format.json { head :no_content }
    end
  end
end
