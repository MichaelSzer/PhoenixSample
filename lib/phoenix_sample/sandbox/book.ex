# many-to-one with author
defmodule PhoenixSample.Sandbox.Book do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixSample.Sandbox.{Author, Book}

  schema "book" do
    field :title, :string

    belongs_to :author, Author
  end

  def changeset(%Book{} = author, attrs \\ []) do
    author
    |> cast(attrs, [:name])
  end
end
