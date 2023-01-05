# frozen_string_literal: true

XSL_LINK = "\n<?xml-stylesheet href=\"/visualizer.xslt\" type=\"text/xsl\"?>"

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
    respond_to do |format|
      # format.xml { render xml: render_client(Main.all.to_xml) }
      # Раздокументируй строку выше и задокументируй строку ниже, чтобы увидеть xml в html виде
      format.xml { render xml: Main.all.to_xml }
      format.html { @calcs = Main.order(clicks: :desc).page params[:page] }
    end
  end

  private

  def render_client(xml)
    xml.insert(xml.index("\n"), XSL_LINK)
  end

end

# rails g model main query_number:integer query_sequence:string sequences:string maxsequence:string sequences_number:integer