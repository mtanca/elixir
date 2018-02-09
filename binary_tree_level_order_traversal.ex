@doc """
Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
For example: binary tree [3,9,20,nil,nil,15,7],
     3
    / \
   9  20
     /  \
    15   7
 """
 #remove @doc comments to run

defmodule BinaryTree do
  def traverse_nodes(list) do
    list
    |> get_root_node
    |> chunk_children_nodes
    |> traverse_by_level
  end

  # PRIVATE FUNCTIONS
  defp get_root_node(list) do
    [head | tail] = list
    
    [head, tail]
  end

  defp chunk_children_nodes(list) do
    children_nodes = Enum.at(list, 1)
    chunked_children = Enum.chunk_every(children_nodes, 2)

    [hd(list), chunked_children]
  end

  defp traverse_by_level(list, level \\ 0)

  defp traverse_by_level([], _level), do: nil

  # guard clause for root node
  defp traverse_by_level(list, level) when level < 1 do
    root_node = List.first(list)
    new_list = List.last(list)

    [root_node, traverse_by_level(new_list, level + 1)]
  end

  defp traverse_by_level(list, level) when level >= 1 do
    child_nodes = Enum.take(list, level)
    new_list = list -- child_nodes

    [child_nodes, traverse_by_level(new_list, level * 2)]
  end
end
