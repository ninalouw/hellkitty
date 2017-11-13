class PortfoliosController < ApplicationController
  before_action :authenticate_user, except: [:index]
  before_action :find_portfolio, only: [:show, :edit, :update, :destroy]
  before_action :authorize_access, only: [:show, :edit, :update, :destroy]

  # ACTIONS
  # creates new portfolio, displays a form
  def new
    @portfolio = Portfolio.new
    @portfolio_category = PortfolioCategory.all
  end

  # handles creating the portfolio after the form has been submitted
  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio_category = PortfolioCategory.all
    @portfolio.user = current_user
    if @portfolio.save
        flash[:success] = 'New Portfolio item created!'
        redirect_to portfolio_path(@portfolio)
    else
      flash[:error] = 'Please see errors below'
      render :new
    end
  end

  # shows particular portfolios when you click on them
  def show
    # find_portfolio method gets called here
  end

  # displays all the portfolios
  def index
    @portfolios = Portfolio.order(:portfolio_category_id)
    @portfolio_categories = PortfolioCategory.order(:id)
  end

  # gets a portfolio for editing
  def edit
    @portfolio_category = PortfolioCategory.all
    # find_portfolio method gets called here
  end

  def update
    # find_portfolio method gets called here
    if @portfolio.update(portfolio_params)
        flash[:success] = 'Portfolio item updated!'
        redirect_to portfolio_path(@portfolio)
    else
        flash[:error] = 'Please see errors below!'
        render :edit
    end
  end

  def destroy
    # find_portfolio method gets called here
    @portfolio.destroy
    redirect_to portfolios_path , notice: 'Portfolio item deleted'
  end

  # Methods created to refactor code
  private
  # find_portfolio method, gets called on :show, :edit, :update, :destroy
  def find_portfolio
    @portfolio = Portfolio.find params[:id]
  end

  # portfolio_params method used for defining params in create and update
  def portfolio_params
    params.require(:portfolio).permit(:title, :body,:portfolio_category_id)
  end

  def authorize_access
    unless can? :manage, @portfolio
      redirect_to root_path, alert: 'Access Denied.'
     end
  end
end
