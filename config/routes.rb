# Application's rooting file. It tells Rails how to connect incoming requests to controllers and actions.


Rails.application.routes.draw do
  get 'article/show'

  get 'articles/new'

  # tells Rails to map requests to http://localhost:3000/welcome/index to the welcome controller's index action
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  # tells Rails to map requests to the root of the application to the welcome controller's index action
  root 'welcome#index'
end
