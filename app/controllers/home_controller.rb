class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    if current_user
      tenant_id_from_session = session[:account_id]

      if tenant_id_from_session.present?
        ActsAsTenant.current_tenant = Account.find_by(id: tenant_id_from_session)
      elsif current_user.accounts.any?
        ActsAsTenant.current_tenant = current_user.accounts.first
        # E salvamos o ID na sessão para as próximas requisições.
        session[:account_id] = ActsAsTenant.current_tenant.id
      end
    end

    @tenant = ActsAsTenant.current_tenant
    params[:account_id] = @tenant.id
  end
end
