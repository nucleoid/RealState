class ImagesController < ApplicationController
  before_action :set_resources

  def index
    @images = @property.images.all
  end

  def show
  end

  def new
    @image = @property.images.new
  end

  def edit
  end

  def create
    @image = @property.images.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to property_images_path(@property), notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to property_images_path(@property), notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to property_images_url(@property), notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_resources
      @property = Property.find(params[:property_id])
      @image = @property.images.find(params[:id]) if params[:id].present?
    end

    def image_params
      params.require(:image).permit(:url, :is_featured)
    end

    def property
      @property = Property.find(params[:property_id])
    end
end
