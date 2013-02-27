class ViolenceKindsController < ApplicationController
  # GET /violence_kinds
  # GET /violence_kinds.json
  def index
    @violence_kinds = ViolenceKind.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @violence_kinds }
    end
  end

  # GET /violence_kinds/1
  # GET /violence_kinds/1.json
  def show
    @violence_kind = ViolenceKind.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @violence_kind }
    end
  end

  # GET /violence_kinds/new
  # GET /violence_kinds/new.json
  def new
    @violence_kind = ViolenceKind.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @violence_kind }
    end
  end

  # GET /violence_kinds/1/edit
  def edit
    @violence_kind = ViolenceKind.find(params[:id])
  end

  # POST /violence_kinds
  # POST /violence_kinds.json
  def create
    @violence_kind = ViolenceKind.new(params[:violence_kind])

    respond_to do |format|
      if @violence_kind.save
        format.html { redirect_to @violence_kind, notice: 'Violence kind was successfully created.' }
        format.json { render json: @violence_kind, status: :created, location: @violence_kind }
      else
        format.html { render action: "new" }
        format.json { render json: @violence_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /violence_kinds/1
  # PUT /violence_kinds/1.json
  def update
    @violence_kind = ViolenceKind.find(params[:id])

    respond_to do |format|
      if @violence_kind.update_attributes(params[:violence_kind])
        format.html { redirect_to @violence_kind, notice: 'Violence kind was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @violence_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /violence_kinds/1
  # DELETE /violence_kinds/1.json
  def destroy
    @violence_kind = ViolenceKind.find(params[:id])
    @violence_kind.destroy

    respond_to do |format|
      format.html { redirect_to violence_kinds_url }
      format.json { head :no_content }
    end
  end
end
