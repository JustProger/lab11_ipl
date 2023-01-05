# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Mains', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /mains' do
    it 'returns http success' do
      get main_all_path
      expect(response).to have_http_status(:success)
    end
  end

  # # Тестируем маршрут вывода результата
  # describe 'GET /result' do
  #   # Сценарий, когда параметры неправильные
  #   context 'when params are invalid' do
  #     # создаем случайные значения
  #     let(:query_number) { Faker::Number.within(range: 10..20) }
  #     let(:query_sequence) do
  #       mas = []
  #       query_number.times { mas << Faker::Number.number(digits: 3) }
  #       mas.join(Faker::Alphanumeric.alpha(number: 1)) # намеренно соединяем числа в строку при помощи рандомной буквы
  #     end

  #     # перед каждым тестом делать запрос (xhr: true - значит асинхронно, чтобы работал turbo)
  #     before { result_path, params: { query_number:, query_sequence: }, xhr: true }

  #     it 'returns http success' do
  #       expect(response).to have_http_status(:success)
  #     end

  #     it 'renders result templates' do
  #       expect(response).to render_template(:result)
  #       expect(response).to render_template(:_result_message)
  #     end

  #     it 'responds with turbo stream' do
  #       expect(response.content_type).to match(%r{text/vnd.turbo-stream.html})
  #     end

  #     it 'assigns invalid model object' do
  #       expect(@controller.view_assigns['maincontr'].valid?).to be false
  #       # @controller.view_assigns['maincontr']
  #     end
  #   end

  #   # Сценарий, когда парамаетры правильные
  #   context 'when params are ok' do
  #     # создаем случайные значения
  #     let(:query_number) { Faker::Number.within(range: 10..20) }
  #     let(:query_sequence) do
  #       mas = []
  #       query_number.times { mas << Faker::Number.number(digits: 3) }
  #       mas.join(' ')
  #     end

  #     # перед каждым тестом делать запрос (params - параметры запроса, xhr: true - выполнить асинхронно, чтобы работал turbo)
  #     before { post result_path, params: { query_number:, query_sequence: }, xhr: true }

  #     it 'returns http success' do
  #       expect(response).to have_http_status(:success)
  #     end

  #     it 'renders result templates' do
  #       expect(response).to render_template(:result)
  #       expect(response).to render_template(:_result_message)
  #     end

  #     it 'responds with turbo stream' do
  #       expect(response.content_type).to match(%r{text/vnd.turbo-stream.html})
  #     end

  #     it 'assigns valid model object' do
  #       expect(@controller.view_assigns['maincontr'].valid?).to be true
  #     end
  #   end
  # end

end
