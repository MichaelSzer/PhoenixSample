# one-to-many with book
defmodule PhoenixSample.Sandbox.Author do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixSample.Sandbox.{Book}

  @primary_key {:name, :string, autogenerate: false}
  schema "authors" do
    has_many(:books, Book, foreign_key: :author, references: :name)
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name])
  end
end
