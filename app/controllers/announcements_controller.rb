class AnnouncementsController < ApplicationController
#   before_action :authenticate_user, except: [:index, :show]
  before_action :find_announcement, only: [:show, :edit, :update, :destroy]
#   before_action :authorize_access, only: [:edit, :update, :destroy]

  # ACTIONS
  # creates new announcement, displays a form
  def new
    @announcement = Announcement.new
  end

  # handles creating the announcement after the form has been submitted
  def create
    @announcement = Announcement.new(announcement_params)
    # @announcement.user = current_user
    if @announcement.save
        flash[:notice] = 'New announcement created!'
        redirect_to announcement_path(@announcement)
    else
      flash.now[:alert] = 'Please see errors below'
      render :new
    end
  end

  # shows particular announcements when you click on them
  def show
    # find_announcement method gets called here
  end

  # displays all the announcements
  def index
    @announcements = Announcement.order(created_at: :desc)
  end

  # gets a announcement for editing
  def edit
    # find_announcement method gets called here
  end

  def update
    # find_announcement method gets called here
    if @announcement.update(announcement_params)
        flash[:notice] = 'Announcement updated'
        redirect_to announcement_path(@announcement)
    else
        flash.now[:alert] = 'Please see errors below!'
        render :edit
    end
  end

  def destroy
    # find_announcement method gets called here
    @announcement.destroy
    redirect_to announcements_path , notice: 'Announcement deleted'
  end

  # Methods created to refactor code
  private
  # find_announcement method, gets called on :show, :edit, :update, :destroy
  def find_announcement
    @announcement = Announcement.find params[:id]
  end

  # announcement_params method used for defining params in create and update
  def announcement_params
    params.require(:announcement).permit(:title, :body)
  end

#   def authorize_access
#     unless can? :manage, @announcement
#       # head :unauthorized #this will send empty HTTP request
#       redirect_to root_path, alert: 'Access Denied. You did not create this question!'
#      end
#   end
end
