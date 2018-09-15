class Hotel < ActiveRecord::Base
  belongs_to :manager, class_name: User, foreign_key: 'manager_id'

  validates :name, presence: true
  # validates :description, presence: true  # Can be blank depending on the locale
  validates :country_code, presence: true
  validate :country_code_needs_to_be_valid_iso
  validates :views_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :average_price, presence: true, numericality: { greater_than: 0 }
  validate :manager_is_a_real_user

  monetize :average_price_cents, with_currency: lambda { |hotel|
    begin
      hotel_curr = IsoCountryCodes.find(hotel.country_code).currency # may throw because of nil country_code in specs
      Money.new(100, hotel_curr) # may throw because of strange randomly picked countries (e.g. Tuvalu) with currencies unknown to Money
      # hotel_curr.nil? ? Money.default_currency : hotel_curr
      hotel_curr
    rescue StandardError
      Money.default_currency # Money.default_currency.to_str correctly gives the currency code already
    end
  }

  translates :description, fallbacks_for_empty_translations: true

  def incr_view_cnt!
    self.views_count += 1
    save
  end

  private

  def country_code_needs_to_be_valid_iso
    begin
      IsoCountryCodes.find(country_code)
    rescue StandardError
      errors.add(:country_code, "The country code has to be a valid ISO code")
    end
  end

  def manager_is_a_real_user
    begin
      User.find(manager_id)
    rescue StandardError
      errors.add(:manager, "The manager has to be a real user")
    end
  end
end
