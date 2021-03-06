Rails.application.routes.draw do

  mount Upmin::Engine => '/_admin'

  get 'colophon', to: 'static_page#colophon'

  get 'suggestion', to: 'suggestion#new'
  post 'suggestion', to: 'suggestion#create'
  get 'suggestion/success', to: 'suggestion#success'

  get 'search', to: 'search#results'

  get 'venue', to: 'venue#index'
  get 'venue/:id', to: 'venue#show'

  root 'search#index'

end
