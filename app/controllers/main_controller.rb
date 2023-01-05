class MainController < ApplicationController
  def index
  end

  def show
    # @result = [params[:query_number], params[:query_sequence]]
    id = params[:id].to_i
    if id && Main.find_by(id: id)
      @calc = Main.find(id)
    end
  end

  def result
    @calc = Main.new(Main.result(params))
    if @calc.save
      redirect_to main_show_url(id: @calc.id)
    else
        flash[:alert] ||= []
        @calc.errors.each do |error|
          flash[:alert] << [-1,error.full_message,nil,error.details[:value]]
        end
        redirect_to root_url
    end
  end

  def all
  end
end

# rails g model main query_number:integer query_sequence:string result_sequences:string result_maxsequence:string result_sequences_number:integer