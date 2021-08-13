class EmployeesController < ApplicationController
  def index
    @employees = Employee.all 
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)
    if @employee.save
      redirect_to @employee
    else
      render :edit
    end

  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit
    end

  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    redirect_to employees_path
  end

  private
    def employee_params
      params.require(:employee).permit(:name,:mobile_number,:pan_card,:address)
    end

end


