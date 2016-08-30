# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    name "All Sold"
    sql_query "select * from properties where is_sold=1"

    factory :report_invalid do
      name "All Sold"
      sql_query nil
    end
  end
end
