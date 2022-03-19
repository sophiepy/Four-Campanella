class HomesController < ApplicationController
  def top
    @items = Item.all
  end
  def about
  end
  def info
  end
end
