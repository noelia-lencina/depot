class StoreController < ApplicationController
  def index
  	@products = Product.order(:title) #Le pide al modelo los productos y ordena el resultado por el titulo
  end
end
