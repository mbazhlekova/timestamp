defmodule TimestampMicroserviceElixirWeb.Router do
  use TimestampMicroserviceElixirWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TimestampMicroserviceElixirWeb do
    pipe_through :api

    get "/timestamp/:date", TimestampController, :show
  end
end
