class CalcController < ApplicationController
  def index
    @result = nil
  end

  def calculate
    @num1 = params[:num1].to_f
    @num2 = params[:num2].to_f
    @operation = params[:operation]

    case @operation
    when 'add'
      @result = @num1 + @num2
    when 'subtract'
      @result = @num1 - @num2
    when 'multiply'
      @result = @num1 * @num2
    when 'divide'
      if @num2 != 0
        @result = @num1 / @num2
      else
        flash[:error] = "Cannot divide by zero"
        redirect_to action: :index and return
      end
    else
      flash[:error] = "Invalid operation"
      redirect_to action: :index and return
    end

    render :index
  end
end