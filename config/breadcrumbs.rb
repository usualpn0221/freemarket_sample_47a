crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_path
  parent :root
end

crumb :item do |item|
  link "#{item.name}", item_path(item)
  parent :root
end

crumb :profile do
  link 'プロフィール', profile_path
  parent :mypage
end
