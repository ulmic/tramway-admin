module Tramway::Admin::UserExtension
  enumerize :role, in: [ :user, :admin ], default: :user

  def admin?
    role.admin?
  end
end
