defmodule Turing.Game.Move do
  #new #add #delete
  def new do
    []
  end

  def add([_, _, _, _] = balls, _ball), do: balls

  def add(balls, ball) do
    balls ++ [ball]
  end

  def remove([_, _, _, _] = balls), do: balls

  def remove(balls) do
    List.delete_at(balls, -1)
  end
end
