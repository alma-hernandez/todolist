Rails.application.routes.draw do
  root 'homepage#index'

  # Add routes below this line
  get 'tasks' => 'tasks#index'

  # Add routes below above line
  post 'tasks' => 'tasks#create'
  
  delete 'task/:id' => 'tasks#destroy'
  
  # Redirect all other paths to index page, which will be taken over by AngularJS
  get '*path' => 'homepage#index'
  put '/tasks/:id/mark/complete' => 'tasks#mark_complete'
end
