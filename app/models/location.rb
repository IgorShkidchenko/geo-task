class Location < ApplicationRecord
  validates :ip, presence: true, uniqueness: true, format:  {
    with: Resolv::AddressRegex
  }
end
