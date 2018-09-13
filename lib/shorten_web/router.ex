defmodule ShortenWeb.Router do
  use ShortenWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ShortenWeb do
    get "/:code", LinkController, :code
  end

  scope "/api", ShortenWeb do
    pipe_through :api

    post "/links", LinkController, :create

    # Debugging links
    get "/links", LinkController, :index
    get "/links/:code", LinkController, :show
    delete "/links/:code", LinkController, :delete

  end
end
