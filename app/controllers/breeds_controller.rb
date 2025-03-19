class BreedsController < ApplicationController
  def index
    if params[:q].present?
      breeds = Breed.where("name ILIKE ?", "%#{params[:q]}%")
    else
      breeds = Breed.all
    end

    @breeds = if params[:parent_id].present?
                breeds.where(parent_id: params[:parent_id])
              else
                breeds.where(parent_id: nil)
              end

    @breeds = @breeds.order(:name).page(params[:page]).per(20)
  end

  def show
    @breed = Breed.find(params[:id])
  end
end
