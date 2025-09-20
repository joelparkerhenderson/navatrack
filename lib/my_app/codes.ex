defmodule MyApp.Codes do
  use Ash.Domain,
    otp_app: :navatrack

  resources do
    resource MyApp.Codes.InternationalLaborOrganizationInternationalStandardClassificationOfOccupations2008
  end
end
