# frozen_string_literal: true

XSL_LINK = "\n<?xml-stylesheet href=\"/visualizer.xslt\" type=\"text/xsl\"?>"

class MainController < ApplicationController
  def index; end

  def show
    id = params[:id].to_i
    calc = Main.find_by(id:)
    return unless id && calc

    @calc = calc
  end

  def deleteall
    if Main.all.empty?
      redirect_to root_path, notice: 'В БД нет записей для удаления'
    else
      Main.delete_all
      redirect_to root_path, notice: 'Все записи в БД успешно удалены!'
    end
  end

  def delete
    id = params[:id].to_i
    calc_to_delete = Main.find_by(id:)
    if id && calc_to_delete
      calc_to_delete.delete
      redirect_to request.referrer
    else
      redirect_to root_path, notice: 'Что-то пошло не так: запись не была удалена...'
    end
  end

  def result
    @calc = Main.new(Main.result(params))
    if @calc.save
      redirect_to main_show_url(id: @calc.id)
    else
      flash[:alert] ||= []
      @calc.errors.each do |error|
        flash[:alert] << [-1, error.full_message, nil, error.details[:value]]
      end
      redirect_to root_url
    end
  end

  def showall
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
