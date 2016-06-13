ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Shipbit.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Shipbit.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Shipbit.Repo)

