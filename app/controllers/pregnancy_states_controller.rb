class PregnancyStatesController < ApplicationController
  # GET /pregnancy_states
  # GET /pregnancy_states.json
  def index
    @pregnancy_states = PregnancyState.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pregnancy_states }
    end
  end

  # GET /pregnancy_states/1
  # GET /pregnancy_states/1.json
  def show
    @pregnancy_state = PregnancyState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pregnancy_state }
    end
  end

  # GET /pregnancy_states/new
  # GET /pregnancy_states/new.json
  def new
    @pregnancy_state = PregnancyState.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pregnancy_state }
    end
  end

  # GET /pregnancy_states/1/edit
  def edit
    @pregnancy_state = PregnancyState.find(params[:id])
  end

  # POST /pregnancy_states
  # POST /pregnancy_states.json
  def create
    @pregnancy_state = PregnancyState.new(params[:pregnancy_state])

    respond_to do |format|
      if @pregnancy_state.save
        format.html { redirect_to @pregnancy_state, notice: 'Pregnancy state was successfully created.' }
        format.json { render json: @pregnancy_state, status: :created, location: @pregnancy_state }
      else
        format.html { render action: "new" }
        format.json { render json: @pregnancy_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pregnancy_states/1
  # PUT /pregnancy_states/1.json
  def update
    @pregnancy_state = PregnancyState.find(params[:id])

    respond_to do |format|
      if @pregnancy_state.update_attributes(params[:pregnancy_state])
        format.html { redirect_to @pregnancy_state, notice: 'Pregnancy state was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pregnancy_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pregnancy_states/1
  # DELETE /pregnancy_states/1.json
  def destroy
    @pregnancy_state = PregnancyState.find(params[:id])
    @pregnancy_state.destroy

    respond_to do |format|
      format.html { redirect_to pregnancy_states_url }
      format.json { head :no_content }
    end
  end
end
