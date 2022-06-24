# Create policy

```bash
rails g model Policy start_date:date end_date:date contractable:references\{polymorphic\}
```

```ruby
has_many :policies, as: :contractable
```

# Create Claims

```bash
rails g model Claim occurrence_date:date type:string
```

```ruby
class Smartphone::DamageClaim < Claim
end
class Auto::DamageClaim < Claim
end
```

# Refactor policy and claim

To be refactored:

```ruby
class Policy < ApplicationRecord
  RATE_IOF = 1.0738
  RATE_BROKERAGE = 0.0001
  validates :premium_value_cents, numericality: {greater_than: 0}
  has_many :premium_movements, dependent: :destroy
  has_many :events, as: :publisher

  aasm do
    before_all_events :memoize_current_attributes
    after_all_events :publish_transition_events
  end

  def publish_created_event
    publish_event("created", data: attributes)
  end
  # ...
end
class Claim < ApplicationRecord
  has_many :claim_movements, dependent: :destroy
  validates :user_id, presence: true
  has_many :events, as: :publisher

  aasm do
    before_all_events :memoize_current_attributes
    after_all_events :publish_transition_events
  end

  def publish_created_event
    publish_event("created", data: attributes)
  end
  # ...
end
```

New Concern

```ruby
module EventPublishable
  extend ActiveSupport::Concern
  included do
    has_many :events, as: :publisher
    aasm do
      before_all_events :memoize_current_attributes
      after_all_events :publish_transition_event
    end
  end

  def publish_created_event
    publish_event("created", data: attributes)
  end
  # ...
end
```
