class LoansController < ApplicationController
  # before_action :set_loan, only: [:status]
  def new
    @loan =Loan.new
    render :application
  end

  def create
 
    @loan = Loan.new(loan_params)  # Create a new loan object with the provided params
   
    @loan.user_id =  session[:user_id]# Associate loan with the currently logged-in user
    p (@loan)
    if @loan.save  # If loan saves successfully
      redirect_to user_path(@current_user), notice: "Loan application submitted successfully!"  # Redirect to user dashboard
    else
      puts @loan.errors.full_messages  
      render :application, status: :unprocessable_entity  # Render the form again with errors if loan creation fails
    end
  end

  
  private 
  def loan_params
    params.require(:loan).permit(:company_name, :industry, :description, :revenue, :operating_expenses, :net_income, :years_in_business, :loan_amount)

  end
end
 