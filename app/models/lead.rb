class Lead < ApplicationRecord

    validate :file_size_under_ten_mb 

    def initialize(params = {})
        super        
        @file = params[:attached_file]
        if @file
            self.attached_file = @file.open()
            self.attached_file_path = @file.path()
        end
    end

    NUM_BYES_IN_MEGABYTE = 1048576
    def file_size_under_ten_mb 
        if @file
            if (@file.size.to_f / NUM_BYES_IN_MEGABYTE) > 10
                errors.add(:attached_file, 'File size cannot be over 10 megabytes')
            end
        end
    end

    private
    def sanitize_filename(filename)
        # Get only the filename, not the whole path (for IE)
        return File.basename(filename)
    end
end

