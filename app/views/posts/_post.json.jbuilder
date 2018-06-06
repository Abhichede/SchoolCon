json.extract! post, :id, :title, :description, :created_at, :updated_at
json.post_attachments{
  json.array! @post_attachments, partial: 'post_attachments/post_attachment', as: :post_attachment
}
json.url post_url(post, format: :json)
