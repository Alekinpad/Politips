Rails.application.routes.draw do
	
  root to: 'sitios#index'

  get 'sitios/resultado'

  get 'sitios/contacto'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
