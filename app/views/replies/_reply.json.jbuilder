json.extract! reply, :id, :body, :comment_id, :user_id, :bug_id, :created_at, :updated_at
json.url reply_url(reply, format: :json)
