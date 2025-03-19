class FactsController < ApplicationController
  def show
    @fact = Fact.find(params[:id])    
  end
end
