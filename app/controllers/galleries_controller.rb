class GalleriesController < ApplicationController
  before_action :authenticate_user, except: [:index]
  before_action :find_gallery, only: [:show, :edit, :update, :destroy]
  before_action :authorize_access, only: [:show, :edit, :update, :destroy]

  # ACTIONS
  # creates new gallery, displays a form
  def new
    @gallery = Gallery.new
    @category = Category.all
  end

  # handles creating the gallery after the form has been submitted
  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.user = current_user
    if @gallery.save
        flash[:success] = 'New gallery item created!'
        redirect_to gallery_path(@gallery)
    else
      flash[:error] = 'Please see errors below'
      render :new
    end
  end

  # shows particular gallerys when you click on them
  def show
    # find_gallery method gets called here
  end

  # displays all the gallerys
  def index
    @galleries = Gallery.order(created_at: :desc)
  end

  # gets a gallery for editing
  def edit
    @category = Category.all
    # find_gallery method gets called here
  end

  def update
    # find_gallery method gets called here
    if @gallery.update(gallery_params)
        flash[:success] = 'Gallery item updated!'
        redirect_to gallery_path(@gallery)
    else
        flash[:error] = 'Please see errors below!'
        render :edit
    end
  end

  def destroy
    # find_gallery method gets called here
    @gallery.destroy
    redirect_to galleries_path , notice: 'Gallery item deleted'
  end

  # Methods created to refactor code
  private
  # find_gallery method, gets called on :show, :edit, :update, :destroy
  def find_gallery
    @gallery = Gallery.find params[:id]
  end

  # gallery_params method used for defining params in create and update
  def gallery_params
    params.require(:gallery).permit(:title, :body, :image, :category_id)
  end

  def authorize_access
    unless can? :manage, @gallery
      redirect_to root_path, alert: 'Access Denied.'
     end
  end
end
