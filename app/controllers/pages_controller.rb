class PagesController < ApplicationController
  skip_before_action :authenticate_user! #, only: [ :landing ]

  def landing
  end

  def app
    @products = Product.all
  end
end
