# many-to-one with author
defmodule PhoenixSample.Sandbox.Book do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:author, :string, autogenerate: false}
  schema "books" do
    field :title, :string
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title])
  end
end
