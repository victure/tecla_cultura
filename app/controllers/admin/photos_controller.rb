class Admin::PhotosController < ApplicationController
  before_filter :load_gallery
  # GET /photos
  # GET /photos.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new
    @multiple = params[:multiple] == "true"

    respond_to do |format|
      if @multiple
        format.html { render :partial=> "admin/galleries/upload_photos_step", :layout=>!@multiple}
      else
        format.html #normal
      end
      format.json { render json: @photo }
    end
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])
    respond_to do |format|
      if @photo.save
        format.html { redirect_to edit_admin_gallery_path(:id=>@gallery.id), notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def multiple_create
    @photo = Photo.new(params[:photo])
    @photo.gallery_id = @gallery.id
    @photo.save
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to edit_admin_gallery_path(:id=>@gallery.id) }
      format.json { render :json => true }
    end
  end

  def load_gallery
    print "\nparams.nil?=>#{params}\n"
    if !params[:gallery_id].nil? or  !params[:photo].nil? 
      gallery_id = params[:gallery_id] || params[:photo][:gallery_id]
      @gallery = Gallery.find_by_id(gallery_id)
    end
  end
end
