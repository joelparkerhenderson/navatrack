defmodule ZID do
  @doc """
  Convert from a ZID string (without hyphens) to a UUID string (with hyphens).

  Example:

      ZID.to_uuid("1234567891234123412341234567890ab")
      # => "12345678-1234-1234-1234-1234567890ab"

  """
  def to_uuid_string(zid_string) do
    Regex.replace(~r/^([0-9a-f]{8})([0-9a-f]{4})([0-9a-f]{4})([0-9a-f]{4})([0-9a-f]{12})$/, zid_string, "\\1-\\2-\\3-\\4-\\5")
  end

end
