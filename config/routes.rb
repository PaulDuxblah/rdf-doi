Rails.application.routes.draw do
  get 'rdf/index'

  get '*path' => 'rdf#graph'

  root 'rdf#index'
end
