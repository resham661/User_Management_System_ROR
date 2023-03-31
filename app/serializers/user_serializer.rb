class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :username, :email, :status, :roles

  def roles
    object.roles.pluck(:role_name).uniq
  end

end
