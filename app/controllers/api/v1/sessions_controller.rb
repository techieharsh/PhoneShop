class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json

  skip_before_action :verify_authenticity_token, raise: false

  private

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end
end
