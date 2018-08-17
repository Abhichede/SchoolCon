json.extract! post, :id, :title
json.post_attachments{
  json.array! post.post_attachments, partial: 'api/posts/attachment', as: :attachment
}