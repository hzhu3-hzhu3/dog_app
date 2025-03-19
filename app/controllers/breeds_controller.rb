class BreedsController < ApplicationController
  def index
    if params[:q].present?
      breeds = Breed.where("LOWER(name) LIKE LOWER(?)", "%#{params[:q]}%")
    else
      breeds = Breed.all
    end

    if params[:parent_id].present? && params[:parent_id] != ""
      parent_id = params[:parent_id].to_i
      breeds = breeds.where(parent_id: parent_id)
    else
      breeds = breeds.where(parent_id: nil)
    end

    @breeds = breeds.order(:name).page(params[:page]).per(20)
  end

  def show
    @breed = Breed.find(params[:id])
  end
end
