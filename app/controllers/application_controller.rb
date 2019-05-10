class ApplicationController < ActionController::Base
    # [...]
    before_action :authenticate_user!
    helper_method :current_order
    # before_action :configure_permitted_parameters, if: :devise_controller?
    include Pundit

    # Pundit: white-list approach.
    after_action :verify_authorized, except: [:index, :new_tshirt], unless: :skip_pundit?
    after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

    # Uncomment when you *really understand* Pundit!
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    def user_not_authorized
      flash[:alert] = "Access denied"
      redirect_to(request.referrer || tshirts_path)
    end

    def current_order
      if session[:order_id]
        Order.find(session[:order_id])
      else
        Order.new
      end
    end

     private

    def skip_pundit?
      devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
    end

     protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:photo])
    end
end
