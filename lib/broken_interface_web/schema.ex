defmodule BrokenInterfaceWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Schema.Notation

  object :dog do
    interface :pet

    field :name, :string
  end

  object :cat do
    interface :pet

    field :name, :string
  end

  interface :pet do
    field :name, :string

    resolve_type fn
      %{type: "dog"}, _ -> :dog
      %{type: "cat"}, _ -> :cat
    end
  end

  query do
    field :pets, list_of(:pet) do
      resolve fn _, _, _ ->
        {:ok, [%{type: "dog", name: "spot"}, %{type: "cat", name: "snowball"}]}
      end
    end
  end
end
