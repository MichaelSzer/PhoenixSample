# one-to-many with book
defmodule PhoenixSample.Sandbox.Author do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixSample.Sandbox.{Author, Book}

  schema "author" do
    field :name, :string

    has_many :books, Book
  end

  def changeset(%Author{} = author, attrs \\ []) do
    author
    |> cast(attrs, [:name])
  end
end
