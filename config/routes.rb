Blog::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'index#index'

  get '/feed.:format' => 'index#index'
  get '/feed/category/:slug.:format' => 'category#index' do
    @slug = params[:slug]
    erb :slug
  end

  get '/feed/tag/:slug.:format' => 'tag#index' do
    @slug = params[:slug]
    erb :slug
  end

 #resources :categories
 get '/category/:slug' => 'category#index' do
    @slug = params[:slug]
    erb :slug
  end

 get '/post/:slug' => 'post#index' do
    @slug = params[:slug]
    erb :slug
  end

 get '/tag/:slug' => 'tag#index' do
    @slug = params[:slug]
    erb :slug
  end

  get "/about/" => "index#index"
  get "/about/:username" => "index#index"

  get "/login/" => "session#new"

  resources :session

end
