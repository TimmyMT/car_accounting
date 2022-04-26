# frozen_string_literal: true

class CarsFilter
  attr_reader :relation, :params

  def initialize(relation, params)
    @relation = relation
    @params = params
  end

  def call
    relation = filter_by_number(@relation)
    relation = filter_by_manufacturer(relation)
    filter_by_model(relation)
  end

  private

  def filter_by_number(relation)
    return relation if !params[:number] || params[:number].empty?

    relation.by_number(params[:number])
  end

  def filter_by_manufacturer(relation)
    return relation if !params[:manufacturer] || params[:manufacturer].empty?

    relation.by_manufacturer(params[:manufacturer])
  end

  def filter_by_model(relation)
    return relation if !params[:model] || params[:model].empty?

    relation.by_model(params[:model])
  end
end
