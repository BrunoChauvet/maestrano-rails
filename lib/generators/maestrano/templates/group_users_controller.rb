class Maestrano::Account::GroupUsersController < Maestrano::Rails::WebHookController

  # DELETE /maestrano/account/groups/cld-1/users/usr-1/:tenant
  # Remove a user from a group
  def destroy
    # Set the right uid based on Maestrano.param('sso.creation_mode')
    user_uid = Maestrano.mask_user(params[:id],params[:group_id]) 
    group_uid = params[:group_id]
    tenant = params[:tenant]
    
    # Perform association deletion steps here
    # --
    # If Maestrano.param('sso.creation_mode') is set to virtual
    # then you might want to just delete/cancel/block the user
    #
    # E.g
    # user = User.find_by_tenant_and_uid(tenant, user_uid)
    # organization = Organization.find_by_tenant_and_uid(tenant ,group_uid)
    # 
    # if Maestrano.param('sso.creation_mode') == 'virtual'
    #  user.destroy
    # else
    #   organization.remove_user(user)
    #   user.block_access! if user.reload.organizations.empty?
    # end
  end
end