defmodule ElixirToy.Repo do
  use Ecto.Repo,
    otp_app: :elixir_toy,
    adapter: Ecto.Adapters.Postgres
end
