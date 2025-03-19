class DogDiseasesController < ApplicationController
  def show
    @dog_disease = DogDisease.find(params[:id])    
  end
end
