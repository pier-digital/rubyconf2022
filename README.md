# Create policy

```bash
rails g model Policy start_date:date end_date:date contractable:references\{polymorphic\}
```

```ruby
has_many :policies, as: :contractable
```
