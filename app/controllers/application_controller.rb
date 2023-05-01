class ApplicationController < ActionController::API
  def authenticate_user!
    token = request.headers['Authorization']
    binding.break
    if token.present?
      token = token.split(' ').last
      decoded_token = AuthenticationService.decode_token(token)
      @current_user = User.find(decoded_token['id'])
    else
      render json: { error: 'You must be logged in to do that' }, status: :unauthorized
    end
  end
end
