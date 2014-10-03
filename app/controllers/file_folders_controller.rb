class FileFoldersController < ApplicationController
  before_action :set_current_user#:set_file_folder, only: [:show, :edit, :update, :destroy]

  # GET /file_folders
  # GET /file_folders.json
  def index
    @file_folders = FileFolder.all
  end

  # GET /file_folders/1
  # GET /file_folders/1.json
  def show
  end

  # GET /file_folders/new
  def new
    @file_folder = FileFolder.new
  end

  # GET /file_folders/1/edit
  def edit
  end

  # POST /file_folders
  # POST /file_folders.json
  def create
    #@file_folder = FileFolder.new(file_folder_params)

    @folder = current_user.folders.where("id = ?", params[:current_folder_id]).first
    @files = @folder.file_folders.build   
    io_file = params[:file]
    @files.store(io_file)

    unless @files.errors.empty?
      respond_to do |format|
        format.js {render js: "alert('#{@files.errors.full_messages.join(',').to_s}')", status: 400}        
      end
      return
    else
      respond_to do |format|
        @files = [] << @files
        format.js {render "files_list", status: 200}
      end
      return
    end    
  end

  # PATCH/PUT /file_folders/1
  # PATCH/PUT /file_folders/1.json
  def update
    respond_to do |format|
      if @file_folder.update(file_folder_params)
        format.html { redirect_to @file_folder, notice: 'File folder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @file_folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_folders/1
  # DELETE /file_folders/1.json
  def destroy
    @file_folder.destroy
    respond_to do |format|
      format.html { redirect_to file_folders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_folder
      @file_folder = FileFolder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_folder_params
      params[:file_folder]
    end
end
