Rails.application.routes.draw do
    resources :blogs, only: [:index, :show, :create]
    post '/blogs/:id' => 'blogs#create_reply'
    #get '/like' => 'blogs#like'
end
