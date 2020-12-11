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