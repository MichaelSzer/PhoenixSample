# one-to-many with book
defmodule PhoenixSample.Sandbox.Author do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixSample.Sandbox.{Book}

  schema "authors" do
    field :name, :string

    has_many :books, Book
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name])
  end
end
