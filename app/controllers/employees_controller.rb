class EmployeesController < ApplicationController
  def index
    matching_employees = Employee.all

    @list_of_employees = matching_employees.order({ :created_at => :asc })

    render({ :template => "employees/index" })
  
  end

end
