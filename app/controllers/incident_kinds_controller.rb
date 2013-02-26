class IncidentKindsController < ApplicationController
  # GET /incident_kinds
  # GET /incident_kinds.json
  def index
    @incident_kinds = IncidentKind.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @incident_kinds }
    end
  end

  # GET /incident_kinds/1
  # GET /incident_kinds/1.json
  def show
    @incident_kind = IncidentKind.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @incident_kind }
    end
  end

  # GET /incident_kinds/new
  # GET /incident_kinds/new.json
  def new
    @incident_kind = IncidentKind.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @incident_kind }
    end
  end

  # GET /incident_kinds/1/edit
  def edit
    @incident_kind = IncidentKind.find(params[:id])
  end

  # POST /incident_kinds
  # POST /incident_kinds.json
  def create
    @incident_kind = IncidentKind.new(params[:incident_kind])

    respond_to do |format|
      if @incident_kind.save
        format.html { redirect_to @incident_kind, notice: 'Incident kind was successfully created.' }
        format.json { render json: @incident_kind, status: :created, location: @incident_kind }
      else
        format.html { render action: "new" }
        format.json { render json: @incident_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /incident_kinds/1
  # PUT /incident_kinds/1.json
  def update
    @incident_kind = IncidentKind.find(params[:id])

    respond_to do |format|
      if @incident_kind.update_attributes(params[:incident_kind])
        format.html { redirect_to @incident_kind, notice: 'Incident kind was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @incident_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incident_kinds/1
  # DELETE /incident_kinds/1.json
  def destroy
    @incident_kind = IncidentKind.find(params[:id])
    @incident_kind.destroy

    respond_to do |format|
      format.html { redirect_to incident_kinds_url }
      format.json { head :no_content }
    end
  end
end
