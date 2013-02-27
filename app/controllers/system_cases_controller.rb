class SystemCasesController < ApplicationController
  # GET /system_cases
  # GET /system_cases.json
  def index
    if can? :read, SystemCase
      @system_cases = SystemCase.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @system_cases }
      end
    else
      redirect_to root_url
    end
  end

  # GET /system_cases/1
  # GET /system_cases/1.json
  def show
    @system_case = SystemCase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @system_case }
    end
  end

  # GET /system_cases/new
  # GET /system_cases/new.json
  def new
    @system_case = SystemCase.new
    @system_case.human_records.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @system_case }
    end
  end

  # GET /system_cases/1/edit
  def edit
    @system_case = SystemCase.find(params[:id])
  end

  # POST /system_cases
  # POST /system_cases.json
  def create
    ActiveRecord::Base.transaction do
      begin
        @humans_records = params[:system_case].delte(:human_records_attributes)
        @emergency = false
        @humans_records.each do |key,human_record|
          @emergency = human_record.delete(:er)
          
        end
        @system_case = SystemCase.new(params[:system_case])
      rescue
        raise ActiveRecord::Rollback
      end
    end

    respond_to do |format|
      if @system_case.save
        format.html { redirect_to @system_case, notice: 'System case was successfully created.' }
        format.json { render json: @system_case, status: :created, location: @system_case }
      else
        format.html { render action: "new" }
        format.json { render json: @system_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /system_cases/1
  # PUT /system_cases/1.json
  def update
    @system_case = SystemCase.find(params[:id])

    respond_to do |format|
      if @system_case.update_attributes(params[:system_case])
        format.html { redirect_to @system_case, notice: 'System case was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @system_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /system_cases/1
  # DELETE /system_cases/1.json
  def destroy
    @system_case = SystemCase.find(params[:id])
    @system_case.destroy

    respond_to do |format|
      format.html { redirect_to system_cases_url }
      format.json { head :no_content }
    end
  end
end
