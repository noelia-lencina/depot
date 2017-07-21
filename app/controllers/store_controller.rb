class StoreController < ApplicationController
  def index
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end
  	@products = Product.order(:title) #Le pide al modelo los productos y ordena el resultado por el titulo
  end
end
