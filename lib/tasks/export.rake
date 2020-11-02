require 'pg'
require 'date'

namespace :export do
    desc "launch all export task"
    task datawarehouse: :environment do
        Rake::Task["export:factquote"].invoke
        Rake::Task["export:factcontact"].invoke
        Rake::Task["export:factelevator"].invoke
        Rake::Task["export:dimcustomers"].invoke
        
    end

     # DimCustomers
     desc "export data from mysql database to postgresql table DimCustomers"
     task dimcustomers: :environment do
         table = Customer.all
         elevators = Elevator.all
         
        # conn = PG::Connection.open(dbname: "datawarehouse_development")
         conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", user: "codeboxx", password: "Codeboxx1!", dbname: "pg_Trevor_Kitchen_team2")
 
         conn.exec("TRUNCATE \"dimcustomers\" RESTART IDENTITY")
 
         table.each do |row|
            # define the maximum range of elevators to select for safety can be uncommented.
            # nb_elevator = 1+rand(50)
            customerID = row.id

            eCounter = 0
            elevators.each do |elevator|
                if elevator.customer_id == customerID
                    eCounter = eCounter + 1
                end                
            end 
            
            nb_elevator = eCounter
             
             # Path to add ramdom date to nil field
             if row.customer_creation_date == nil then
                 Year = 1976+rand(43)
                 Month = 1+rand(11)
                 Day = 1+rand(27)
                 date = Date.new(Year, Month, Day)
                 date = date.strftime("%F")
             else
                 date = row.customer_creation_date.strftime("%F")
             end
             city = "#{row.company_name.gsub("'", "''")} City"
             conn.exec("INSERT INTO \"dimcustomers\" (\"creation_date\", \"company_name\", \"full_name_of_company_main_contact\", \"email_of_company_main_contact\", \"nb_elevator\", \"contact_city\") VALUES ('#{date}', '#{row.company_name.gsub("'", "''")}', '#{row.full_name_company_contact.gsub("'", "''")}', '#{row.email_company_contact.gsub("'", "''")}', #{nb_elevator}, \'#{city}\')")
         end
         conn.finish()
     end 

    # FactContact
    desc "export data from mysql database to postgresql table FactContact"
    task factcontact: :environment do
        table = Lead.all
        
        # conn = PG::Connection.open(dbname: "datawarehouse_development")
        conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", user: "codeboxx", password: "Codeboxx1!", dbname: "pg_Trevor_Kitchen_team2")

        conn.exec("TRUNCATE \"factcontact\" RESTART IDENTITY")

        table.each do |row|

            date = row.created_at.strftime("%F")
           
            conn.exec("INSERT INTO \"factcontact\" (\"id\", \"creation_date\", \"company_name\", \"email\", \"project_name\") VALUES (#{row.id}, '#{date}', '#{row.company_name.gsub("'", "''")}', \'#{row.email}\', \'#{row.project_name.gsub("'", "''")}\')")
        end
  
        conn.finish()
    end

    # FactQuote
    desc "export data from mysql database to postgresql table FactQuote"
    task factquote: :environment do
        table = Quote.all

        # conn = PG::Connection.open(dbname: "datawarehouse_development")
        conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", user: "codeboxx", password: "Codeboxx1!", dbname: "pg_Trevor_Kitchen_team2")

        conn.exec("TRUNCATE \"factquote\" RESTART IDENTITY")

        table.each do |row|

            if row.no_of_elevators == nil then
                row.no_of_elevators = 0
            end


            date = row.created_at.strftime("%F")

            conn.exec("INSERT INTO \"factquote\" (\"id\", \"creation\", \"company_name\", \"email\", \"nb_elevator\") VALUES (#{row.id},' #{date}', '#{row.company_name.gsub("'", "''")}', \'#{row.contact_email}\', \'#{row.no_of_elevators}\')")
        end
        conn.finish()
    end

     # FactElevator
    desc "export data from mysql database to postgresql table FactElevator"
    task factelevator: :environment do
        table = Elevator.all
        # conn = PG::Connection.open(dbname: "datawarehouse_development")
        conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", user: "codeboxx", password: "Codeboxx1!", dbname: "pg_Trevor_Kitchen_team2")

        conn.exec("TRUNCATE \"factelevator\" RESTART IDENTITY")

        table.each do |row|

            date = row.commissioning_date.strftime("%F")
            city = row.column.battery.building.address.city.gsub("'", "''")
           
            conn.exec("INSERT INTO \"factelevator\" (\"id\",\"serial_number\", \"date_of_commissioning\", \"building_id\", \"customer_id\", \"building_city\") VALUES ('#{row.id}', \'#{row.serial_number.gsub("'", "''")}\', '#{date}', \'#{row.column.battery.building_id}\', \'#{row.column.battery.building.customer_id}\', '#{city}')")
         
        end
        conn.finish()
    end

end

