# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :access_action, only: %i[index new create manager_cars]

  def index
    @cars = Car.page(params[:page] || 1).per(params[:per] || 50)
    @cars = CarsFilter.new(Car.all, params).call.order(created_at: :desc)
  end

  def new
    @car = current_user.cars.new
  end

  def create
    @car = current_user.cars.new(car_params)
    exist_car = Car.find_by(car_params)

    if !exist_car && @car.save
      flash[:notice] = "Car added to database"
      redirect_to new_car_path
    elsif exist_car
      flash[:notice] = "Car already exist in database"
      exist_car.update(record_count: exist_car.record_count + 1)
      redirect_to new_car_path
    else
      render :new
    end
  end

  def manager_cars
    @manager = User.find(params[:user_id])
    @cars = @manager.cars
  end

  private

  def access_action
    authorize(nil, policy_class: CarsPolicy)
  end

  def car_params
    params.require(:car).permit(:number, :manufacturer, :model)
  end
end
