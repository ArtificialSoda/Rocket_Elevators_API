# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)


    if user.present?
      if user.customer?

        customerID = Customer.where(admin_user_id: user.id).take[:id]
        
        can :read, AdminUser, id: user.id
        can :read, Customer, admin_user_id: user.id
        can :read, Elevator, customer_id: customerID
        can :read, Column, customer_id: customerID
        can :read, Battery, customer_id: customerID
        can :read, Building, customer_id: customerID
        can :read, BuildingDetail, customer_id: customerID

        # USER ------ CUSTOMER ----- BUILDING
        

      end

      if user.admin?
        can :manage, :all
        cannot :destroy, Employee
        cannot :update, AdminUser
      end
    end

    
    #if !user.admin? && !user.customer?
      #redirect_to root_path
    #end

    cannot [:create], [Lead, Quote, AdminUser]
    cannot [:update], [Lead, AdminUser]
    can :update, AdminUser, id: user.id


    # QUOTE ------ USER ------ CUSTOMER
    # QUOTE: belongs to USER
    # USER: has many QUOTES
    # if admin_user_id in QUOTES === admin_user_id in CUSTOMER >>>> show QUOTE in CUSTOMER's view


   
   
   
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
