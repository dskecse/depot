class CartsController < ApplicationController
  respond_to :js, only: :destroy

  def index
    @carts = Cart.all
    respond_with @carts
  end

  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{ params[:id] }"
      redirect_to root_url, alert: 'Invalid cart'
    else
      respond_with @cart
    end
  end

  def new
    @cart = Cart.new
    respond_with @cart
  end

  def edit
    @cart = Cart.find(params[:id])
    respond_with @cart
  end

  def create
    @cart = Cart.new(params[:cart])
    flash[:notice] = 'Cart was successfully created.' if @cart.save
    respond_with @cart
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update_attributes(params[:cart])
      flash[:notice] = 'Cart was successfully updated.'
    end
    respond_with @cart
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_with @cart, location: root_path
  end
end
