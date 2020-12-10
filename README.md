# Rails JS Todo List App Backend

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
rails g scaffold Task name notes:text complete:boolean user:references todo_list:references
```