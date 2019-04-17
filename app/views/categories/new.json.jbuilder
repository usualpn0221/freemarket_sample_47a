  json.array! @sub_categories do |sub_category|
  json.id sub_category.id
  json.name sub_category.name
  json.parent_id sub_category.parent_id
end
