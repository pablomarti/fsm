class EducationalLevelsController < ApplicationController
  # GET /educational_levels
  # GET /educational_levels.json
  def index
    @educational_levels = EducationalLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @educational_levels }
    end
  end

  # GET /educational_levels/1
  # GET /educational_levels/1.json
  def show
    @educational_level = EducationalLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @educational_level }
    end
  end

  # GET /educational_levels/new
  # GET /educational_levels/new.json
  def new
    @educational_level = EducationalLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @educational_level }
    end
  end

  # GET /educational_levels/1/edit
  def edit
    @educational_level = EducationalLevel.find(params[:id])
  end

  # POST /educational_levels
  # POST /educational_levels.json
  def create
    @educational_level = EducationalLevel.new(params[:educational_level])

    respond_to do |format|
      if @educational_level.save
        format.html { redirect_to @educational_level, notice: 'Educational level was successfully created.' }
        format.json { render json: @educational_level, status: :created, location: @educational_level }
      else
        format.html { render action: "new" }
        format.json { render json: @educational_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /educational_levels/1
  # PUT /educational_levels/1.json
  def update
    @educational_level = EducationalLevel.find(params[:id])

    respond_to do |format|
      if @educational_level.update_attributes(params[:educational_level])
        format.html { redirect_to @educational_level, notice: 'Educational level was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @educational_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /educational_levels/1
  # DELETE /educational_levels/1.json
  def destroy
    @educational_level = EducationalLevel.find(params[:id])
    @educational_level.destroy

    respond_to do |format|
      format.html { redirect_to educational_levels_url }
      format.json { head :no_content }
    end
  end
end
