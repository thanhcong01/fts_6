class RegistersController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  def new
    @register = Register.new
    @subjects = Subject.all
    @categories = Category.all
    params[:category_id] = Category.first.id if Category.first
    @registers = current_user.registers.order "created_at DESC"
  end

  def create
    unless params[:register][:subject_id].nil? && params[:register][:category_id].nil?
      params[:register][:subject_id].each do |id|
        @register = Register.new create_register_params
        @register.finish = false
        @register.mark = 0
        @register.user_id = current_user.id
        @register.subject_id = id
        @register.count_correct = 0
        @register.date_test = Time.now
        @register.start = false
        unless @register.save
          flash.now[:error] = "Sorry, error! please try again."
        end
      end
    end
    redirect_to new_register_path
  end

  def edit
    @register = Register.find params[:id]
    @answer_sheets = @register.answer_sheets
    check_finish @register
  end

  def show
    @register = Register.find params[:id]
    @answer_sheets = @register.answer_sheets
    if request.path != register_path(@register)
      redirect_to @register, status: :moved_permanently
    end
  end

  def update
    if !params[:register_id].nil?
      @register = Register.find params[:register_id] 
      @register.start = true
      @register.date_test = Time.now
      @register.save
      redirect_to edit_register_path @register
    else
      @register = Register.find params[:register][:id]
      @register.finish = true
      if @register.update_attributes update_register_params
        flash[:success] = "test success"
      end
      redirect_to new_register_path
    end
  end

  private

    def create_register_params
      params.require(:register).permit(:category_id)
    end
    def update_register_params
      params.require(:register).permit(:category_id, 
                                 answer_sheets_attributes: [:answer_id]) 
    end
end
