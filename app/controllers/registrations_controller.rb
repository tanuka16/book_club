class RegistrationsController < Devise::RegistrationsController



  protected

  def after_sign_up_path_for(resources)
    '/pricing'                                    # when a user signs up they go to this price path 
  end

end
