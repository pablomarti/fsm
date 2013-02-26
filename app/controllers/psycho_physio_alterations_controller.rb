class PsychoPhysioAlterationsController < ApplicationController
  # GET /psycho_physio_alterations
  # GET /psycho_physio_alterations.json
  def index
    @psycho_physio_alterations = PsychoPhysioAlteration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @psycho_physio_alterations }
    end
  end

  # GET /psycho_physio_alterations/1
  # GET /psycho_physio_alterations/1.json
  def show
    @psycho_physio_alteration = PsychoPhysioAlteration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @psycho_physio_alteration }
    end
  end

  # GET /psycho_physio_alterations/new
  # GET /psycho_physio_alterations/new.json
  def new
    @psycho_physio_alteration = PsychoPhysioAlteration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @psycho_physio_alteration }
    end
  end

  # GET /psycho_physio_alterations/1/edit
  def edit
    @psycho_physio_alteration = PsychoPhysioAlteration.find(params[:id])
  end

  # POST /psycho_physio_alterations
  # POST /psycho_physio_alterations.json
  def create
    @psycho_physio_alteration = PsychoPhysioAlteration.new(params[:psycho_physio_alteration])

    respond_to do |format|
      if @psycho_physio_alteration.save
        format.html { redirect_to @psycho_physio_alteration, notice: 'Psycho physio alteration was successfully created.' }
        format.json { render json: @psycho_physio_alteration, status: :created, location: @psycho_physio_alteration }
      else
        format.html { render action: "new" }
        format.json { render json: @psycho_physio_alteration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /psycho_physio_alterations/1
  # PUT /psycho_physio_alterations/1.json
  def update
    @psycho_physio_alteration = PsychoPhysioAlteration.find(params[:id])

    respond_to do |format|
      if @psycho_physio_alteration.update_attributes(params[:psycho_physio_alteration])
        format.html { redirect_to @psycho_physio_alteration, notice: 'Psycho physio alteration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @psycho_physio_alteration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /psycho_physio_alterations/1
  # DELETE /psycho_physio_alterations/1.json
  def destroy
    @psycho_physio_alteration = PsychoPhysioAlteration.find(params[:id])
    @psycho_physio_alteration.destroy

    respond_to do |format|
      format.html { redirect_to psycho_physio_alterations_url }
      format.json { head :no_content }
    end
  end
end
