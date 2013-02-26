class WeaponKindsController < ApplicationController
  # GET /weapon_kinds
  # GET /weapon_kinds.json
  def index
    @weapon_kinds = WeaponKind.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weapon_kinds }
    end
  end

  # GET /weapon_kinds/1
  # GET /weapon_kinds/1.json
  def show
    @weapon_kind = WeaponKind.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @weapon_kind }
    end
  end

  # GET /weapon_kinds/new
  # GET /weapon_kinds/new.json
  def new
    @weapon_kind = WeaponKind.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @weapon_kind }
    end
  end

  # GET /weapon_kinds/1/edit
  def edit
    @weapon_kind = WeaponKind.find(params[:id])
  end

  # POST /weapon_kinds
  # POST /weapon_kinds.json
  def create
    @weapon_kind = WeaponKind.new(params[:weapon_kind])

    respond_to do |format|
      if @weapon_kind.save
        format.html { redirect_to @weapon_kind, notice: 'Weapon kind was successfully created.' }
        format.json { render json: @weapon_kind, status: :created, location: @weapon_kind }
      else
        format.html { render action: "new" }
        format.json { render json: @weapon_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /weapon_kinds/1
  # PUT /weapon_kinds/1.json
  def update
    @weapon_kind = WeaponKind.find(params[:id])

    respond_to do |format|
      if @weapon_kind.update_attributes(params[:weapon_kind])
        format.html { redirect_to @weapon_kind, notice: 'Weapon kind was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @weapon_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weapon_kinds/1
  # DELETE /weapon_kinds/1.json
  def destroy
    @weapon_kind = WeaponKind.find(params[:id])
    @weapon_kind.destroy

    respond_to do |format|
      format.html { redirect_to weapon_kinds_url }
      format.json { head :no_content }
    end
  end
end
