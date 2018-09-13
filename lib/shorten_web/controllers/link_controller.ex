defmodule ShortenWeb.LinkController do
  use ShortenWeb, :controller

  alias Shorten.Links
  alias Shorten.Links.Link

  action_fallback ShortenWeb.FallbackController

  def code(conn, params = %{"code" => code}) do
    case Links.get_link(params) do
      link = %Link{} ->
        conn
        |> redirect external: link.url
      nil ->
        conn
        |> put_resp_content_type("application/json")
        |> json %{status: "error", reason: "not found"}
    end
  end

  def index(conn, _params) do
    links = Links.list_links()
    conn
    |> put_resp_content_type("application/json")
    |> render("index.json", links: links)
  end

  def create(conn, %{"link" => link_params}) do
    with {:ok, %Link{} = link} <- Links.create_link(link_params) do
      conn
      |> put_status(:created)
      |> put_resp_content_type("application/json")
      |> put_resp_header("location", link_path(conn, :show, link))
      |> render("show.json", link: link)
    end
  end

  def show(conn, params = %{"code" => code}) do
    case Links.get_link(params) do
      link = %Link{} ->
        conn
        |> put_resp_content_type("application/json")
        |> render("show.json", link: link)
      nil ->
        conn
        |> put_resp_content_type("application/json")
        |> json %{status: "error", reason: "not found"}
    end
  end

  def delete(conn, params = %{"code" => code}) do
    case Links.get_link(params) do
      nil ->
        conn
        |> put_resp_content_type("application/json")
        |> json %{status: "error", reason: "not found"}
      link ->
        with {:ok, %Link{}} <- Links.delete_link(link) do
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(:no_content, "")
        end
    end
  end
end
