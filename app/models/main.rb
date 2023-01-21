# frozen_string_literal: true

class EquationOfNumberAndSequenceNumberValidator < ActiveModel::Validator
  def validate(record)
    # добавлена проверка на равенство nil, т. к. в ином случае в тестах модуля MaincontrResult в файле maincontr_result_spec.rb возникает ошибка, связанная с невозможностью применить .split к объекту nil (т. е. query_sequence не инициализирован?)
    if (!record.query_sequence.nil? ? record.query_sequence.split.map(&:to_i).size : 'for tests of this model') != record.query_number.to_i
      record.errors.add :base, 'Количество введённых чисел последовательности не соответствует тому, что было введено'
    end
  end
end

class Main < ApplicationRecord
  # include ActiveModel::Serializers::Xml
  # Сколько элементов выводить на страницу по умолчанию - просто чтобы быстрее увидеть пагинацию.
  paginates_per 5

  validates :query_number, :query_sequence, presence: { message: 'не может быть пустым' } # проверка на обязательное наличие полей
  validates :query_sequence, uniqueness: true
  # validates :sequences, :maxsequence, :sequences_number, presence: true

  validates :query_number, format: { with: /\A\d+\z/, message: 'должно быть натуральным числом' }

  @ptrn_list_and_error_messages = [
    { ptrn: /\A[\s\d]+\z/, err_msg: 'состоит только из натуральных чисел, разделённых пробелами' }
  ]

  @ptrn_list_and_error_messages.each do |el|
    validates :query_sequence, format: { with: el[:ptrn], message: el[:err_msg] }
  end

  validates_with EquationOfNumberAndSequenceNumberValidator

  def self.result(params)
    number = params[:query_number].to_i
    array = params[:query_sequence].split.map(&:to_i)
    enum = array.slice_when do |before, after|
      before_mod = is_square?(before)
      after_mod = is_square?(after)
      (!before_mod && after_mod) || (before_mod && !after_mod)
    end

    sequences = enum.to_a.select { |array| array.any? { |element| is_square?(element) } }

    { query_number: number,
      query_sequence: params[:query_sequence],
      sequences: JSON.generate(sequences),
      maxsequence: JSON.generate(sequences.max_by(&:size)),
      sequences_number: sequences.size }
  end

  def self.is_square?(x)
    (Math.sqrt(x) % 1).zero?
  end
end
