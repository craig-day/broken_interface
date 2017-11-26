defmodule BrokenInterfaceWeb.Router do
  use BrokenInterfaceWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BrokenInterfaceWeb do
    pipe_through :api
  end

  forward "/graphiql",
    Absinthe.Plug.GraphiQL,
    schema: BrokenInterfaceWeb.Schema,
    interface: :simple

  forward "/", Absinthe.Plug,
    schema: BrokenInterfaceWeb.Schema
end
