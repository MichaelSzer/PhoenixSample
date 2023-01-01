# many-to-one with author
defmodule PhoenixSample.Sandbox.Book do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixSample.Sandbox.{Author}

  schema "book" do
    field :title, :string

    belongs_to :author, Author
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title])
  end
end
