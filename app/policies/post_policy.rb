class PostPolicy < ApplicationPolicy
  def approve?
    user.admin?
  end

  def reject?
    user.admin?
  end
end