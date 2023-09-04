defmodule FizzBuzz do
  def build(file_name) do
      file_name
      |> File.read()
      |> handle_file_read()
  end

  #pipe operator o |> envia a variavel diretamente para a função, semprecisar por dentro handle_file_read(file_name)
  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.split(",") #separa os numeros "1,2,3" -> ["1","2","3","4"]
      |> Enum.map(&convert_and_evaluate_numbers/1 ) #& já roda por si só um função, e o /1 é a quantidade de parametros que vao ser aceitas

      {:ok, result}
    end
  defp handle_file_read({:error, reason}), do: {:error, "Erro reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(elem) do
    elem
    |> String.to_integer()
    |> evaluate_numbers()
    # number = String.to_integer(elem)
    # evaluate_numbers(number)
  end
  
  defp evaluate_numbers(number) when rem(number,3) == 0 and rem(number,5) == 0, do: :fizzbuzz
  defp evaluate_numbers(number) when rem(number,3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number,5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end
