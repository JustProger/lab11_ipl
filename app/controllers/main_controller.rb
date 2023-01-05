class MainController < ApplicationController
  def index
  end

  def show
    @result = [params[:query_number], params[:query_sequence]]
  end

  def result
    redirect_to "#{main_show_url}?#{URI.encode_www_form({ query_number: params[:query_number],
                                                            query_sequence: params[:query_sequence]})}"
  end

  def all
  end
end

# rails g model main query_number:integer query_sequence:string result_sequences:string result_maxsequence:string result_sequences_number:integer