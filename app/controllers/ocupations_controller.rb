class OcupationsController < ApplicationController
  # GET /ocupations
  # GET /ocupations.json
  def index
    @ocupations = Ocupation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ocupations }
    end
  end

  # GET /ocupations/1
  # GET /ocupations/1.json
  def show
    @ocupation = Ocupation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ocupation }
    end
  end

  # GET /ocupations/new
  # GET /ocupations/new.json
  def new
    @ocupation = Ocupation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ocupation }
    end
  end

  # GET /ocupations/1/edit
  def edit
    @ocupation = Ocupation.find(params[:id])
  end

  # POST /ocupations
  # POST /ocupations.json
  def create
    @ocupation = Ocupation.new(params[:ocupation])

    respond_to do |format|
      if @ocupation.save
        format.html { redirect_to @ocupation, notice: 'Ocupation was successfully created.' }
        format.json { render json: @ocupation, status: :created, location: @ocupation }
      else
        format.html { render action: "new" }
        format.json { render json: @ocupation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ocupations/1
  # PUT /ocupations/1.json
  def update
    @ocupation = Ocupation.find(params[:id])

    respond_to do |format|
      if @ocupation.update_attributes(params[:ocupation])
        format.html { redirect_to @ocupation, notice: 'Ocupation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ocupation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ocupations/1
  # DELETE /ocupations/1.json
  def destroy
    @ocupation = Ocupation.find(params[:id])
    @ocupation.destroy

    respond_to do |format|
      format.html { redirect_to ocupations_url }
      format.json { head :no_content }
    end
  end
end
