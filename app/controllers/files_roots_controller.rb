class FilesRootsController < ApplicationController
  before_action :authenticate_user!, :set_current_user
  before_action :set_files_root, only: [:show, :edit, :update, :destroy]
  

  # GET /files_roots
  # GET /files_roots.json
  def index
    #@files_roots = FilesRoot.all

    @root = current_user.folders.where("id == folder_id").first
 
    unless @root.nil?
      @folders = @root.subfolders.where("id <> folder_id")
      @files = @root.file_folders
      @folder_new = current_user.folders.new
    else
      respond_to do |format|
        format.html{render 'create_root'}
      end      
      return
    end
    
  end

  # GET /files_roots/1
  # GET /files_roots/1.json
  def show
    @root = current_user.folders.find(params[:id])
    @folders = @root.subfolders

    respond_to do |format|
      format.js{render 'folder_content_list', status: 200}
    end
  end

  # GET /files_roots/new
  def new
    @files_root = FilesRoot.new
  end

  # GET /files_roots/1/edit
  def edit
  end

  # POST /files_roots
  # POST /files_roots.json
  def create
    @files_root = FilesRoot.new(files_root_params)

    respond_to do |format|
      if @files_root.save
        format.html { redirect_to @files_root, notice: 'Files root was successfully created.' }
        format.json { render action: 'show', status: :created, location: @files_root }
      else
        format.html { render action: 'new' }
        format.json { render json: @files_root.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_folder
    @folder = current_user.folders.where("id == ?", params[:current_folder_id]).first
    @add_folder = @folder.subfolders.new
    @add_folder.name = params[:folder][:name] 
    @add_folder.user_id = current_user.id
    @add_folder.save
  
    @add_folder.create_folder

    respond_to do |format|
      if @add_folder.errors.empty?
        format.js{render 'add_to_content_folder', status: 200}
      else
        @add_folder.destroy
        format.js{render js: "alert('#{@add_folder.errors.full_messages.join(',')}');", status: 200}
      end
      
    end

  end

  # PATCH/PUT /files_roots/1
  # PATCH/PUT /files_roots/1.json
  def update
    respond_to do |format|
      if @files_root.update(files_root_params)
        format.html { redirect_to @files_root, notice: 'Files root was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @files_root.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /files_roots/1
  # DELETE /files_roots/1.json
  def destroy
    #@files_root.destroy
    @delete_folder_id = params[:id]
    current_user.folders.find(@delete_folder_id).destroy
    respond_to do |format|
      format.js{ render "delete_from_content_folder", status: 200}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_files_root
      #@files_root = FilesRoot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def files_root_params
      #params[:files_root]
    end
end
