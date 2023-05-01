module Mutations
  module Auth
    class AuthenticationMutation < GraphQL::Schema::Mutation
      #skip_before_action :authenticate_user!, only: [:login]
      
      argument :email, String, required: true
      argument :password, String, required: true

      field :token, String
      field :errors, [String]

      def resolve(**attributes)
        user = User.find_by(email: attributes[:email])

        if user&.authenticate(attributes[:password])
          token = AuthenticationService.encode_token(user_id: user.id)
          { token: token, errors: [] }
        else
          { token: nil, errors: ['Invalid credentials'] }
        end
      end
    end
  end

end