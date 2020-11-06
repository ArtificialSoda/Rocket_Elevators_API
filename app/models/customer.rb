class Customer < ApplicationRecord
    belongs_to :admin_user

    has_many :buildings
    def display_name
        "#{company_name}"
    end

    belongs_to :address
    belongs_to :employee

    
    # has_many :quotes, through: :admin_users
    has_many :batteries
    def display_name
        "#{company_name}"
    end

    has_many :columns
    def display_name
        "#{company_name}"
    end

    has_many :elevators
    def display_name
        "#{company_name}"
    end

    has_many :building_details
    def display_name
        "#{company_name}"
    end
    
    has_many :leads
after_create :upload_file
after_update :upload_file


    def upload_file
        self.leads.all.each do |lead|
        client = DropboxApi::Client.new("Secret")
        if lead.attached_file != nil
            
            client.create_folder "#{lead.customer.company_name}"
            client.upload("/#{lead.customer.company_name}/#{File.basename(lead.original_filename)}", lead.attached_file) 
    
            lead.attached_file = nil
            lead.original_filename = nil
            lead.attachment.purge
    
            lead.save!
            
        end
        end
    end


end
