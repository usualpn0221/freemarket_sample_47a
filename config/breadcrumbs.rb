crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user.id)
  parent :root
end

crumb :item do |item|
  link "#{item.name}", item_path(item)
  parent :root
end

crumb :profile do
  link 'プロフィール', profile_path(current_user.id)
  parent :mypage
end

crumb :logout do
  link 'ログアウト', destroy_user_session_path(current_user.id)
  parent :mypage
end

crumb :confirmation do
  link '本人情報の登録', edit_user_path(current_user.id)
  parent :mypage
end

crumb :method do
  link '支払い方法', edit_creditcard_path(1)
  parent :mypage
end
