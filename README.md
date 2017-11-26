# BrokenInterface

This interface error can be reproduced with the following steps:

1. `mix phx.new broken_interface --no-ecto --no-brunch --no-html`
1. `cd broken_interface`
1. Added `{:absinthe_plug, "~> 1.4"}` to the deps list in `mix.exs`
1. `mix deps.get`
1. Added two forward directives to `lib/broken_interface_web/router.ex`

    ```
      forward "/graphiql",
        Absinthe.Plug.GraphiQL,
        schema: BrokenInterfaceWeb.Schema,
        interface: :simple

      forward "/", Absinthe.Plug,
        schema: BrokenInterfaceWeb.Schema
    ```

1. Wrote out base interface schema in `lib/broken_interface_web/schema.ex`
1. `mix phx.server`
1. View `http://localhost:4000/graphiql` in browser
1. Enter the following query document

    ```
    {
      pets {
        __typename
        ... on Dog {
          name
        }
        ... on Cat {
          name
        }
      }
    }
    ```
1. Notice that GraphiQL things that `Dog` and `Cat` are unknown types, but the query succeeds successfully. The docs also don't tell me that `Dog` or `Cat` implement the interface `Pet`.

    ![](https://content.screencast.com/users/CDay.zendesk/folders/Jing/media/511db1ea-af01-4551-84db-d14deab82058/00000520.png)



To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
