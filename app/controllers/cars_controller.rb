class CarsController < ApplicationController
  before_action :authenticate_user!

  def index
    
  end

  def new
    authorize(nil, policy_class: CarsPolicy)

    car = current_user.cars.new(car_params)
  end

  def create
    authorize(nil, policy_class: CarsPolicy)
    
    car = current_user.cars.new(car_params)

    if car.save
      redirect_to new_car_path
    else
      render :new
    end
  end

  def manager_cars
    authorize(nil, policy_class: CarsPolicy)

    @cars = Car.where(user_id: params[:user_id])
  end

  private

  def car_params
    params.require(:car).permit(:number, :manufacturer, :model)
  end
end
