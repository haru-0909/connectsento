class Admin::GuestsController < ApplicationController

  def guest_sign_in
    admin = Admin.find_or_create_by!(email: 'test@test') do |admin|
      admin.password = SecureRandom.urlsafe_base64
    end
    sign_in admin
    redirect_to admin_users_path
  end
end
