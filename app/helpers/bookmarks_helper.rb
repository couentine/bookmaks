module BookmarksHelper
  def user_can_edit_b?
    policy(@bookmark).edit?
  end

  def user_can_destroy_b?
    policy(@bookmark).destroy?
  end
end
