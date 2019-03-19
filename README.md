# Task_Tracker1
Design Choices:
  User has_many -> Tasks. Task has a fiedl that belongs_to user and user cannot be made without a name. Tasks need to have a name, description and time.

# Task_Tracker2

Manager has_many ->  users. User can be their own manager. Manger can be each other's manager. Timeblock was implemented to complete task. Timeblock has task field that belongs_to -> Task

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
