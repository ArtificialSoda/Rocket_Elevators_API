class CustomersController < InheritedResources::Base

  private

    def customer_params
      params.require(:customer).permit(:user_id, :customer_creation_date, :company_name, :company_headquarter_address, :full_name_company_contact, :company_contact_phone, :email_company_contact, :company_description, :full_name_service_technical_authority, :technical_authority_phone, :technical_manager_email)
    end

end
