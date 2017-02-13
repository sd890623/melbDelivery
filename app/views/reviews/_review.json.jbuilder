json.extract! review, :id, :time, :rating, :comment, :created_at, :updated_at
json.url review_url(review, format: :json)
