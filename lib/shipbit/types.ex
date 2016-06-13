defmodule Shipbit.Types do
  defmodule Game do
    defstruct [:id, :art_path, :critic_score, :developer, :esrb,
               :genre, :link_path, :platforms, :publisher,
               :release_date, :summary, :title]
  end
end
