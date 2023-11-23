class ArtworksController < ApplicationController
  before_action :set_artwork, only: %i[ show edit update destroy ]

  def index
    redirect_to artworks_path
  end

  # GET /artworks or /artworks.json
  def home
    if params.present?
      @artworks = Artwork.joins(:user, :tags).where(query_params)
    else
      @artworks = Artwork.all
    end
  end

  # GET /artworks/1 or /artworks/1.json
  def show
    @reservation = Reservation.new
    @reservation.artwork = @artwork
    @reservation.user = current_user
  end

  # GET /artworks/new
  def new
    @artwork = Artwork.new
  end

  # GET /artworks/1/edit
  def edit
  end

  # POST /artworks or /artworks.json
  def create
    @artwork = Artwork.new(artwork_params)

    respond_to do |format|
      if @artwork.save!
        format.html { redirect_to artwork_url(@artwork), notice: "" }
        format.json { render :show, status: :created, location: @artwork }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artworks/1 or /artworks/1.json
  def update
    respond_to do |format|
      if @artwork.update(artwork_params)
        format.html { redirect_to artwork_url(@artwork), notice: "Artwork was successfully updated." }
        format.json { render :show, status: :ok, location: @artwork }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artworks/1 or /artworks/1.json
  def destroy
    @artwork = Artwork.find(params[:id])

    # Delete associated records in the artwork_tags table
    ArtworkTag.where(artwork_id: @artwork.id).destroy_all

    @artwork.destroy!

    respond_to do |format|
      format.html { redirect_to artworks_url, notice: "Artwork was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_artwork
    @artwork = Artwork.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def artwork_params
    params.require(:artwork).permit(:title, :description, :image, :user_id, :size, :price)
  end

  # Setting the query for the where clause
  def query_params
    hash_param = params.to_enum.to_h
    # set the query for the where clause
    query = ""
    query << "title ILIKE '%#{hash_param["title"]}%' " if hash_param["title"]
    query << "AND nickname ILIKE '%#{hash_param["artist"]}%' " if hash_param["artist"]

    if query.start_with?("AND ")
      query.slice!("AND ")
    end
    query
  end
end
