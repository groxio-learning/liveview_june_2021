defmodule Turing.Counter do

  def new(string) do
    String.to_integer(string)
  end

  def increment(acc) do
    acc + 1
  end

  def show(int) do
    "Hello, Your count is #{int}"
  end

end
