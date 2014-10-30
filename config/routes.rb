Iconsole::Engine.routes.draw do
  get :iconsole, to: 'console#index'
  post :iconsole, to: 'console#cmd', as: :post_iconsole
end
