class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  # Hook do acts_as_tenant para configurar o tenant atual
  set_current_tenant_by_subdomain_or_domain(:account, :subdomain)

  # Adicione o método `current_tenant` para que o Devise possa usá-lo, se necessário.
  def current_tenant
    @current_tenant ||= find_tenant_by_user
  end

  private

  # Método para encontrar o tenant do usuário logado
  def find_tenant_by_user
    if current_user
      # Assume que o usuário já tem uma conta associada.
      # Isso pode ser ajustado se o usuário pertencer a múltiplas contas.
      current_user.account
    else
      # Se não houver usuário logado, retorna nil
      nil
    end
  end
end
