PolymorphicRender
=================

Installing
----------

Add in your gemfile

```ruby
gem 'polymorphic_render'
```

Using
-----

Just write in your views instead:

```haml
= render @model
-# or
= render @models
```

this:

```haml
= polymorphic_render @model
-# or
= polymorphic_render @models
```

And.. nothing changes! :) It renders `views/models/_model` partial and passes `model`
local variable into.

But if you write:

```haml
= polymorphic_render @model, :admin
-# or
= polymorphic_render @models, :admin
```

It renders `views/models/_model_admin` partial and passes `model` local variable into.

When it's useful?
-----------------

- It's useful when your need another partial for resource rendering, so instead:

  ```haml
  - @models.each do |model|
    = render partial: 'model/model_admin', object: model, as: 'model'
  ```

  you can simply write:

  ```haml
  = polymorphic_render @models, :admin
  ```

- It's useful when some model's atribute defines which kind of partial to render:

  ```haml
  = polymorphic_render @model, @model.kind
  ```

License
-------

This project rocks and uses MIT-LICENSE.
