class Api::V1::HotelsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def index
    @hotels = policy_scope(Hotel)
    IncrViewCntJob.perform_later(@hotels.map { |h| h.id })
  end
end
