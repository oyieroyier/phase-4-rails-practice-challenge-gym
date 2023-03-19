class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_message

  def index
    clients = Client.all
    render json: clients, status: :ok
  end

  def show
    client = find_client
    render json: client, status: :ok
  end

  def update
    client = find_client
    client.update(client_params)
  end

  private

  def find_client
    Client.find(params[:id])
  end

  def client_params
    params.permit(:name, :age)
  end

  def render_unprocessable_entity(invalid)
    render json: { error: invalid.record.errors }, status: :unprocessable_entity
  end

  def not_found_message
    render json: { error: 'No such client' }, status: :not_found
  end
end
