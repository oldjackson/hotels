class HotelPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(manager: user)
    end
  end
end
