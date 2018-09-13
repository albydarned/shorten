defmodule ShortenWeb.LinkView do
  use ShortenWeb, :view
  alias ShortenWeb.LinkView

  def render("index.json", %{links: links}) do
    %{data: render_many(links, LinkView, "link.json")}
  end

  def render("show.json", %{link: link}) do
    %{data: render_one(link, LinkView, "link.json")}
  end

  def render("link.json", %{link: link}) do
    %{id: link.id,
      url: link.url,
      code: link.code}
  end
end
