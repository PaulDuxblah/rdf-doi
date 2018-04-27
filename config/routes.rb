Rails.application.routes.draw do
  get 'rdf/index'

  root 'rdf#index'
end
