@doc """
  Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
  For example: binary tree [3,9,20,nil,nil,15,7],
       3
      / \
     9  20
       /  \
      15   7

  Should return: [[3],[9,20],[15,7]]
 """
defmodule BinaryTree do
  def traverse_nodes(list) do
    list
    |> traverse_by_level
    |> remove_nil_nodes
  end

  # PRIVATE FUNCTIONS
  defp traverse_by_level(list, node_list \\ [],level \\ 1)

  defp traverse_by_level([], node_list, _level), do: node_list

  defp traverse_by_level(list, node_list, level) when level == 1 do
    [root_node | tail] = list
    new_node_list = node_list ++ [[root_node]]

    traverse_by_level(tail, new_node_list, level * 2)
  end

  defp traverse_by_level(list, node_list, level) do
    child_nodes = Enum.take(list, level)
    new_list = list -- child_nodes
    new_node_list = node_list ++ [child_nodes]

    traverse_by_level(new_list, new_node_list, level * 2)
  end

  defp remove_nil_nodes(node_list) do
    Enum.map(node_list, fn(node) ->
      Enum.filter(node, fn(element) -> !is_nil(element) end) end)
  end
end
