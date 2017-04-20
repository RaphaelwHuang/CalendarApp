#Modified
  # JA: Added  method to get groups only user is apart of
module GroupsHelper

def user_groups
  @user_groups = []
  @groups.each do |group|
    group.users.each do |user|
      if user.id == current_user.id
        @user_groups.push(group)
      end
    end
  end
    @user_groups
end

end
