# Rails JS Todo List App Backend

For the beginning of this build, we followed along with the [Rails Devise JWT Tutorial](https://github.com/dakotalmartinez/rails-devise-jwt-tutorial)

```
/*
t.string :name 
t.references :user
*/
TodoList
  belongs_to :user
  has_many :tasks

/*
t.string :name 
t.text :notes
t.boolean :complete 
t.references :user
t.references :todo_list
*/
Task
  belongs_to :user
  belongs_to :todo_list
```

```
rails g scaffold TodoList name user:references
```

```
rails g scaffold Task name notes:text completed:boolean user:references todo_list:references
```

```rb
class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  def current_user 
    User.first
  end

  private 
  def handle_record_not_found
    render json: "Record not found", status: :not_found
  end 
end

```
Adding a rescue for ActiveRecord::RecordNotFound allows us to use `find` throughout the application, knowing that any record that is not found will result in a 404 status code response, with a meaningful text error message rather than an internal server error. (500 status code reponse)