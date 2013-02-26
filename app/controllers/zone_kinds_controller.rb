class ZoneKindsController < ApplicationController
  # GET /zone_kinds
  # GET /zone_kinds.json
  def index
    @zone_kinds = ZoneKind.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @zone_kinds }
    end
  end

  # GET /zone_kinds/1
  # GET /zone_kinds/1.json
  def show
    @zone_kind = ZoneKind.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @zone_kind }
    end
  end

  # GET /zone_kinds/new
  # GET /zone_kinds/new.json
  def new
    @zone_kind = ZoneKind.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @zone_kind }
    end
  end

  # GET /zone_kinds/1/edit
  def edit
    @zone_kind = ZoneKind.find(params[:id])
  end

  # POST /zone_kinds
  # POST /zone_kinds.json
  def create
    @zone_kind = ZoneKind.new(params[:zone_kind])

    respond_to do |format|
      if @zone_kind.save
        format.html { redirect_to @zone_kind, notice: 'Zone kind was successfully created.' }
        format.json { render json: @zone_kind, status: :created, location: @zone_kind }
      else
        format.html { render action: "new" }
        format.json { render json: @zone_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /zone_kinds/1
  # PUT /zone_kinds/1.json
  def update
    @zone_kind = ZoneKind.find(params[:id])

    respond_to do |format|
      if @zone_kind.update_attributes(params[:zone_kind])
        format.html { redirect_to @zone_kind, notice: 'Zone kind was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @zone_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zone_kinds/1
  # DELETE /zone_kinds/1.json
  def destroy
    @zone_kind = ZoneKind.find(params[:id])
    @zone_kind.destroy

    respond_to do |format|
      format.html { redirect_to zone_kinds_url }
      format.json { head :no_content }
    end
  end
end
