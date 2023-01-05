# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe 'Mains', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /main/show/all' do
    it 'returns http success' do
      get main_show_all_path
      expect(response).to have_http_status(:success)
    end
  end

  # Тестируем маршрут вывода результата
  describe 'GET /result' do
    # Сценарий, когда параметры неправильные
    context 'when params are invalid' do
      # создаем случайные значения (invalid)
      let(:query_number) { Faker::Number.within(range: 10..20) }
      let(:query_sequence) do
        mas = []
        query_number.times { mas << Faker::Number.number(digits: 3) }
        mas.join(Faker::Alphanumeric.alpha(number: 1)) # намеренно соединяем числа в строку при помощи рандомной буквы
      end

      before { post main_result_path, params: { query_number:, query_sequence: } }
      # before { post "#{main_result_path}?#{URI.encode_www_form({ query_number:, query_sequence: })}" }

      it 'returns http success' do
        expect(response).to have_http_status(302) # redirect_to root_url because
      end

      # it 'renders index tepmlate' do
      #   expect(response).to render_template(:index)
      # end

      it 'redirects to root url' do
        expect(response).to redirect_to(root_url)
        # response.should redirect_to(root_url) # или так
      end

      it 'responds with html' do
        expect(response.content_type).to match(%r{text/html})
      end
    end

    # Сценарий, когда парамаетры правильные
    context 'when params are ok' do
      # создаем случайные значения
      let(:query_number) { Faker::Number.within(range: 10..20) }
      let(:query_sequence) do
        mas = []
        query_number.times { mas << Faker::Number.number(digits: 3) }
        mas.join(' ')
      end

      before { post main_result_path, params: { query_number:, query_sequence: } }

      it 'returns http success' do
        expect(response).to have_http_status(302) # redirect_to main_show_url(id: @calc.id) because
      end

      # it 'renders result templates' do
      #   expect(response).to render_template(:show)
      # end

      it 'redirects to root url' do
        expect(response).to redirect_to(main_show_url(id: @controller.view_assigns['calc'].id)) # или так
      end

      it 'responds with turbo stream' do
        expect(response.content_type).to match(%r{text/html})
      end

      it 'assigns valid model object' do
        expect(@controller.view_assigns['calc'].valid?).to be true
      end
    end
  end
end
