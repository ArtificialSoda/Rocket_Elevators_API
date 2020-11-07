class Customer < ApplicationRecord
    belongs_to :admin_user

    has_many :buildings
    def display_name
        "#{company_name}"
    end

    belongs_to :address
    belongs_to :employee

    
    # has_many :quotes, through: :customers
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
        puts "Upload File"
        leads = Lead.where(email: self.email_company_contact)
        puts leads.to_a
        client = DropboxApi::Client.new("secret")
        leads.each do |lead|
        puts lead
        if lead.attached_file
            puts "lead has attached file"
            
            # client.create_folder "/#{self.company_name}"

            file_name_data = lead.attached_file_path.split("/")
            file_name = file_name_data[file_name_data.length() - 1]
            puts file_name
            puts lead.attached_file
            client.upload("/#{self.company_name}/#{File.basename(file_name)}", lead.attached_file.attachment) 
    
            lead.attached_file = nil
            lead.attached_file_path = nil
            # lead.attached_file.purge
    
            lead.save!
            
        end
        end
    end


end
