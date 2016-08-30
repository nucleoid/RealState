class Report < ApplicationRecord

  validates :name, presence: true, format: { with: /\A[A-Za-z\s]+\z/, message: 'must only contain alphanumeric characters and spaces'}
  validates :sql_query, presence: true

  attr_accessor :results

  def columns
    results.columns.map {|c| c.titleize}
  end

  def values
    results.rows.map {|r| r.map{|v| v.to_s}}
  end

  def run_report
    @results = ActiveRecord::Base.connection.exec_query(self.sql_query)
  end
end
