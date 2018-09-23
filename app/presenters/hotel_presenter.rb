class HotelPresenter < BasePresenter
  presents :hotel # the handle for '@object' in BasePresenter is simply 'hotel'
  delegate :name, to: :hotel
  delegate :description, to: :hotel
  delegate :views_count, to: :hotel
  delegate :id, to: :hotel
  delegate :country_code, to: :hotel
  delegate :manager, to: :hotel

  def average_price
    begin
      humanized_money_with_symbol(hotel.average_price.exchange_to(t('currency')))
    rescue Money::Bank::UnknownRate
      humanized_money_with_symbol(hotel.average_price)
    end
  end
end
