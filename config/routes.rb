Rails.application.routes.draw do
  get 'rdf/index'
  get 'rdf/submit'
  
  root 'rdf#index'
end
