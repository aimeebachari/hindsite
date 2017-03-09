class Users::RegistrationsController < Devise::RegistrationsController
  def destroy
    super
  end

  def show
    @user = User.find(params[:id])
  end
end
