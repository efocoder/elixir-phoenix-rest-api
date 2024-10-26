defmodule RealDealApiWeb.Router do
  use RealDealApiWeb, :router
  use Plug.ErrorHandler

  defp handle_errors(conn, %{reason: %Phoenix.Router.NoRouteError{message: message}}) do
    conn
    |> json(%{errors: message})
    |> halt()
  end

  defp handle_errors(conn, %{reason: %{message: message}}) do
    conn
    |> json(%{errors: message})
    |> halt()
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  pipeline :auth do
    plug RealDealApiWeb.Auth.Pipeline
    plug RealDealApiWeb.Auth.SetAccount
  end

  scope "/api/v2", RealDealApiWeb do
    pipe_through :api
    get "/", DefaultController, :index

    scope "/accounts" do
      post "/register", AccountController, :create
      post "/sign_in", AccountController, :sign_in
    end
  end

  scope "/api/v2", RealDealApiWeb do
    pipe_through [:api, :auth]

    scope "/accounts" do
      get "/", AccountController, :index
      get "/:id", AccountController, :show
      post "/update", AccountController, :update
    end
  end
end
