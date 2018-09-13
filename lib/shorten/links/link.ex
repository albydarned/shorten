defmodule Shorten.Links.Link do
  use Ecto.Schema
  import Ecto.Changeset


  schema "links" do
    field :code, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(url, attrs) do
    url
    |> cast(attrs, [:url])
    |> validate_required([:url])
    |> generate_code
  end

  def generate_code(changeset) do
    changeset
    |> put_change(:code, Shorten.CodeGenerator.new_code)
  end
end
