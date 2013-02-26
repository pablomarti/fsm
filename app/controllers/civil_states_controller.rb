class CivilStatesController < ApplicationController
  # GET /civil_states
  # GET /civil_states.json
  def index
    @civil_states = CivilState.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @civil_states }
    end
  end

  # GET /civil_states/1
  # GET /civil_states/1.json
  def show
    @civil_state = CivilState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @civil_state }
    end
  end

  # GET /civil_states/new
  # GET /civil_states/new.json
  def new
    @civil_state = CivilState.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @civil_state }
    end
  end

  # GET /civil_states/1/edit
  def edit
    @civil_state = CivilState.find(params[:id])
  end

  # POST /civil_states
  # POST /civil_states.json
  def create
    @civil_state = CivilState.new(params[:civil_state])

    respond_to do |format|
      if @civil_state.save
        format.html { redirect_to @civil_state, notice: 'Civil state was successfully created.' }
        format.json { render json: @civil_state, status: :created, location: @civil_state }
      else
        format.html { render action: "new" }
        format.json { render json: @civil_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /civil_states/1
  # PUT /civil_states/1.json
  def update
    @civil_state = CivilState.find(params[:id])

    respond_to do |format|
      if @civil_state.update_attributes(params[:civil_state])
        format.html { redirect_to @civil_state, notice: 'Civil state was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @civil_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /civil_states/1
  # DELETE /civil_states/1.json
  def destroy
    @civil_state = CivilState.find(params[:id])
    @civil_state.destroy

    respond_to do |format|
      format.html { redirect_to civil_states_url }
      format.json { head :no_content }
    end
  end
end
