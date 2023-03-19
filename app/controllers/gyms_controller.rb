class GymsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_message

  def index
    gyms = Gym.all
    render json: gyms, status: :ok
  end

  def show
    gym = find_gym
    render json: gym, status: :ok
  end

  def update
    gym = find_gym
    gym.update(gym_params)
    render json: gym, status: :accepted
  end

  def destroy
    gym = find_gym
    gym.destroy

    head :no_content
  end

  private

  def find_gym
    Gym.find(params[:id])
  end

  def gym_params
    params.permit(:name, :address)
  end

  def render_unprocessable_entity(invalid)
    render json: { error: invalid.record.errors }, status: :unprocessable_entity
  end

  def not_found_message
    render json: { error: 'Gym not found' }, status: :not_found
  end
end
