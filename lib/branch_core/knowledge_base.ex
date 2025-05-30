defmodule BranchCore.KnowledgeBase do
  @moduledoc """
  The KnowledgeBase context.
  """

  import Ecto.Query, warn: false
  alias BranchCore.Repo

  alias BranchCore.KnowledgeBase.Skill

  @doc """
  Returns the list of skills.

  ## Examples

      iex> list_skills()
      [%Skill{}, ...]

  """
  def list_skills do
    Repo.all(Skill)
  end

  @doc """
  Returns the list of skills
  similar to user's inputs.

  ## Examples

      iex> list_similar_skills(some_skill)
      [%Skill{}, ...]

  """
  def list_similar_skills(skill) do
    from(s in Skill, where: like(s.name, ^"%#{skill}%"))
    |> Repo.all()
  end

  @doc """
  Gets a single skill.

  Raises `Ecto.NoResultsError` if the Skill does not exist.

  ## Examples

      iex> get_skill!(123)
      %Skill{}

      iex> get_skill!(456)
      ** (Ecto.NoResultsError)

  """
  def get_skill!(id), do: Repo.get!(Skill, id)

  @doc """
  Gets a single skill by name.

  Returns nil if the Skill does not exist.

  ## Examples

      iex> get_skill_by_name(skill_name)
      %Skill{}

      iex> get_skill_bu_name(skill_name)
      nil

  """
  def get_skill_by_name(name), do: Repo.get_by(Skill, name: name)

  @doc """
  Creates a skill.

  ## Examples

      iex> create_skill(%{field: value})
      {:ok, %Skill{}}

      iex> create_skill(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_skill(attrs \\ %{}) do
    %Skill{}
    |> Skill.changeset(attrs)
    |> Repo.insert()
  end

  def create_skill_if_not_found(attrs) do
    case get_skill_by_name(attrs["name"]) do
      nil -> create_skill(attrs)
      skill -> {:ok, skill}
    end
  end

  @doc """
  Updates a skill.

  ## Examples

      iex> update_skill(skill, %{field: new_value})
      {:ok, %Skill{}}

      iex> update_skill(skill, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_skill(%Skill{} = skill, attrs) do
    skill
    |> Skill.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a skill.

  ## Examples

      iex> delete_skill(skill)
      {:ok, %Skill{}}

      iex> delete_skill(skill)
      {:error, %Ecto.Changeset{}}

  """
  def delete_skill(%Skill{} = skill) do
    Repo.delete(skill)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking skill changes.

  ## Examples

      iex> change_skill(skill)
      %Ecto.Changeset{data: %Skill{}}

  """
  def change_skill(%Skill{} = skill, attrs \\ %{}) do
    Skill.changeset(skill, attrs)
  end
end
