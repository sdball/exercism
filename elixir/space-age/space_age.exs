defmodule SpaceAge do
  @earth_year_seconds   31557600
  @mercury_year_seconds @earth_year_seconds * 0.2408467
  @venus_year_seconds   @earth_year_seconds * 0.61519726
  @mars_year_seconds    @earth_year_seconds * 1.8808158
  @jupiter_year_seconds @earth_year_seconds * 11.862615
  @saturn_year_seconds  @earth_year_seconds * 29.447498
  @uranus_year_seconds  @earth_year_seconds * 84.016846
  @neptune_year_seconds @earth_year_seconds * 164.79132

  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(:earth, seconds),   do: seconds / @earth_year_seconds
  def age_on(:mercury, seconds), do: seconds / @mercury_year_seconds
  def age_on(:venus, seconds),   do: seconds / @venus_year_seconds
  def age_on(:mars, seconds),    do: seconds / @mars_year_seconds
  def age_on(:jupiter, seconds), do: seconds / @jupiter_year_seconds
  def age_on(:saturn, seconds),  do: seconds / @saturn_year_seconds
  def age_on(:uranus, seconds),  do: seconds / @uranus_year_seconds
  def age_on(:neptune, seconds), do: seconds / @neptune_year_seconds
  def age_on(planet, seconds),   do: {:error, "Unknown planet"}
end
