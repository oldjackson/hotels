class IncrViewCntJob < ActiveJob::Base
  queue_as :default

  def perform(ids)
    ids.each do |id|
      Hotel.find(id).incr_view_cnt!
    end
  end
end
