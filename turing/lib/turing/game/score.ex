defmodule Turing.Game.Score do

  def new(guess, answer) do
    %{reds: correct_answers(guess, answer), whites: almost_correct_answers(guess, answer)}
  end

  defp correct_answers(guess, answer) do
    answer
    |> Enum.zip(guess)
    |> Enum.count(fn {value_1, value_2} -> value_1 == value_2 end)
  end

  defp wrong_answers(guess, answer) do
    (guess -- answer) |> Enum.count
  end

  defp almost_correct_answers(guess, answers) do
    Enum.count(guess) - correct_answers(guess, answers) - wrong_answers(guess, answers)
  end
end
