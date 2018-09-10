class Hotel < ActiveRecord::Base
  validates :name, presence: true
  validates :country_code, presence: true
  validates :description, presence: true
  validates :views_count, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

  validate :country_code_needs_to_be_valid_ISO, unless: Proc.new { |h| h.country_code.blank? }

  private

  def country_code_needs_to_be_valid_ISO
    begin
      IsoCountryCodes.find(country_code)
    rescue
      errors.add(:country_code, "The country code has to be a valid ISO code")
    end
  end
end
