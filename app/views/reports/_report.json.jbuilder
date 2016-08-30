json.extract! report, :id, :name, :sql_query, :created_at, :updated_at
json.url report_url(report, format: :json)