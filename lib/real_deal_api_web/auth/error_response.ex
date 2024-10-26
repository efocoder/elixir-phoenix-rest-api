defmodule RealDealApiWeb.Auth.ErrorResponse.Unauthorized do
  defexception message: "Unauthorized", plug_status: 401
end

defmodule RealDealApiWeb.Auth.ErrorResponse.Forbidden do
  defexception message: "You do no have access to this resource", plug_status: 403
end
