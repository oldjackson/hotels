class Hotel < ActiveRecord::Base
  belongs_to :manager, class_name: User, foreign_key: 'manager_id'

  validates :name, presence: true
  validates :description, presence: true
  validates :country_code, presence: true
  validate :country_code_needs_to_be_valid_ISO
  validates :views_count, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :average_price, presence: true, :numericality => { :greater_than => 0 }
  validate :manager_is_a_real_user

  monetize :average_price_cents

  private

  def country_code_needs_to_be_valid_ISO
    begin
      IsoCountryCodes.find(country_code)
    rescue
      errors.add(:country_code, "The country code has to be a valid ISO code")
    end
  end

  def manager_is_a_real_user
    begin
      mgr = User.find(manager_id)
    rescue
      errors.add(:manager, "The manager has to be a real user")
    end
  end

end
