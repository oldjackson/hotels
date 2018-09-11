class Api::V1::HotelsController < Api::V1::BaseController
  def index
    @hotels = policy_scope(Hotel)
  end
end
