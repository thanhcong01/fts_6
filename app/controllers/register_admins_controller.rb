class RegisterAdminsController < ApplicationController
  def index
    @registers = Register.all.order "created_at DESC"
  end

  def edit
    @register = Register.find params[:id]
    @answer_sheets = @register.answer_sheets
  end

  def update
    @register = Register.find params[:register][:id]
    if @register.update_attributes register_params
      flash[:success] = "checked success"
    end
    redirect_to register_admins_url
  end

  def destroy
    Register.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to register_admins_url
  end

  private

    def register_params
      params.require(:register).permit(:category_id, 
                                 answer_sheets_attributes: [:answer_id, :correct]) 
    end
end
