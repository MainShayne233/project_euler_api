Rails.application.routes.draw do
  root 'problems#github'
  get '/api/problem/(:number)/check/(:solution)' => 'problems#check'
end
