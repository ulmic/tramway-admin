class Tramway::User::User < ::Tramway::Core::ApplicationRecord
  enumerize :role, in: [ :user, :admin ], default: :user

  def admin?
    role.admin?
  end
end
