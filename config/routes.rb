Rails.application.routes.draw do
  #  if Rails.env.development?
  # mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  # end
  resources :reservations, only: [:index, :show, :create]
  resources :restaurants

  post "/graphql", to: "graphql#execute"
end
