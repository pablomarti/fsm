class HumanDocumentsController < ApplicationController
  # GET /human_documents
  # GET /human_documents.json
  def index
    @human_documents = HumanDocument.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @human_documents }
    end
  end

  # GET /human_documents/1
  # GET /human_documents/1.json
  def show
    @human_document = HumanDocument.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @human_document }
    end
  end

  # GET /human_documents/new
  # GET /human_documents/new.json
  def new
    @human_document = HumanDocument.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @human_document }
    end
  end

  # GET /human_documents/1/edit
  def edit
    @human_document = HumanDocument.find(params[:id])
  end

  # POST /human_documents
  # POST /human_documents.json
  def create
    @human_document = HumanDocument.new(params[:human_document])

    respond_to do |format|
      if @human_document.save
        format.html { redirect_to @human_document, notice: 'Human document was successfully created.' }
        format.json { render json: @human_document, status: :created, location: @human_document }
      else
        format.html { render action: "new" }
        format.json { render json: @human_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /human_documents/1
  # PUT /human_documents/1.json
  def update
    @human_document = HumanDocument.find(params[:id])

    respond_to do |format|
      if @human_document.update_attributes(params[:human_document])
        format.html { redirect_to @human_document, notice: 'Human document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @human_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /human_documents/1
  # DELETE /human_documents/1.json
  def destroy
    @human_document = HumanDocument.find(params[:id])
    @human_document.destroy

    respond_to do |format|
      format.html { redirect_to human_documents_url }
      format.json { head :no_content }
    end
  end
end
