defmodule RealDealApiWeb.DefaultController do
  use RealDealApiWeb, :controller

  def index(conn, _params) do
    text(conn, "This application is running in #{String.upcase(Atom.to_string(Mix.env()))} mode")
  end
end
