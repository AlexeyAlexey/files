class DbStructuresController < ApplicationController
  layout "db_structure"
  #before_action :set_db_structure, only: [:show, :edit, :update, :destroy]

  # GET /db_structures
  # GET /db_structures.json
  def index
    @db_structures = DbStructure.all

    Rails.application.eager_load! unless Rails.configuration.cache_classes

    
  end

  # GET /db_structures/1
  # GET /db_structures/1.json
  def show
  end

  # GET /db_structures/new
  def new
    @db_structure = DbStructure.new
  end

  # GET /db_structures/1/edit
  def edit
  end

  # POST /db_structures
  # POST /db_structures.json
  def create
    @db_structure = DbStructure.new(db_structure_params)

    respond_to do |format|
      if @db_structure.save
        format.html { redirect_to @db_structure, notice: 'Db structure was successfully created.' }
        format.json { render action: 'show', status: :created, location: @db_structure }
      else
        format.html { render action: 'new' }
        format.json { render json: @db_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /db_structures/1
  # PATCH/PUT /db_structures/1.json
  def update
    respond_to do |format|
      if @db_structure.update(db_structure_params)
        format.html { redirect_to @db_structure, notice: 'Db structure was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @db_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /db_structures/1
  # DELETE /db_structures/1.json
  def destroy
    @db_structure.destroy
    respond_to do |format|
      format.html { redirect_to db_structures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_db_structure
      @db_structure = DbStructure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def db_structure_params
      params[:db_structure]
    end
end
