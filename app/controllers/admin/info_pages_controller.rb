class Admin::InfoPagesController < ApplicationController
  # GET /info_pages
  # GET /info_pages.json
  def index
    @info_pages = InfoPage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @info_pages }
    end
  end

  # GET /info_pages/1
  # GET /info_pages/1.json
  def show
    @info_page = InfoPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @info_page }
    end
  end

  # GET /info_pages/new
  # GET /info_pages/new.json
  def new
    @info_page = InfoPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @info_page }
    end
  end

  # GET /info_pages/1/edit
  def edit
    @info_page = InfoPage.find(params[:id])
  end

  # POST /info_pages
  # POST /info_pages.json
  def create
    @info_page = InfoPage.new(params[:info_page])

    respond_to do |format|
      if @info_page.save
        format.html { redirect_to admin_info_pages_path, notice: 'Info page was successfully created.' }
        format.json { render json: @info_page, status: :created, location: @info_page }
      else
        format.html { render action: "new" }
        format.json { render json: @info_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /info_pages/1
  # PUT /info_pages/1.json
  def update
    @info_page = InfoPage.find(params[:id])

    respond_to do |format|
      if @info_page.update_attributes(params[:info_page])
        format.html { redirect_to admin_info_pages_path, notice: 'Info page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @info_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /info_pages/1
  # DELETE /info_pages/1.json
  def destroy
    @info_page = InfoPage.find(params[:id])
    @info_page.destroy

    respond_to do |format|
      format.html { redirect_to admin_info_pages_path }
      format.json { head :no_content }
    end
  end
end
