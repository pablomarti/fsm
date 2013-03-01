class AggressionKindsController < ApplicationController
  # GET /aggression_kinds
  # GET /aggression_kinds.json
  def index
    @aggression_kinds = AggressionKind.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aggression_kinds }
    end
  end

  # GET /aggression_kinds/1
  # GET /aggression_kinds/1.json
  def show
    @aggression_kind = AggressionKind.find(params[:id])

    respond_to do |format|
      format.html  show.html.erb
      format.json { render json: @aggression_kind }
    end
  end

  # GET /aggression_kinds/new
  # GET /aggression_kinds/new.json
  def new
    @aggression_kind = AggressionKind.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @aggression_kind }
    end
  end

  # GET /aggression_kinds/1/edit
  def edit
    @aggression_kind = AggressionKind.find(params[:id])
  end

  # POST /aggression_kinds
  # POST /aggression_kinds.json
  def create
    @aggression_kind = AggressionKind.new(params[:aggression_kind])

    respond_to do |format|
      if @aggression_kind.save
        format.html { redirect_to @aggression_kind, notice: 'Aggression kind was successfully created.' }
        format.json { render json: @aggression_kind, status: :created, location: @aggression_kind }
      else
        format.html { render action: "new" }
        format.json { render json: @aggression_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aggression_kinds/1
  # PUT /aggression_kinds/1.json
  def update
    @aggression_kind = AggressionKind.find(params[:id])

    respond_to do |format|
      if @aggression_kind.update_attributes(params[:aggression_kind])
        format.html { redirect_to @aggression_kind, notice: 'Aggression kind was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aggression_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aggression_kinds/1
  # DELETE /aggression_kinds/1.json
  def destroy
    @aggression_kind = AggressionKind.find(params[:id])
    @aggression_kind.destroy

    respond_to do |format|
      format.html { redirect_to aggression_kinds_url }
      format.json { head :no_content }
    end
  end
end
