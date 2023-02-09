# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'admin@admin',
   password: 'testtest'
)

users = User.create!(
  [
    {email: 'haruki@test.com', name: 'はるき', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg"), introduction: '東京の銭湯巡ってます。' },
    {email: 'ofuro@test.com', name: 'お風呂太郎', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg"), introduction: '全国のおすすめの銭湯を発信します'},
    {email: 'sento@test.com', name: '銭湯次郎', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)

Post.create!(
  [
    {title: '梅の湯', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), caption: 'サウナが無料で入れる銭湯です。コスパがよくおすすめです！', address: '荒川区 梅の湯', user_id: users[0].id },
    {title: '万年湯', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), caption: 'ソウルタウン新大久保を歩いてたら銭湯があったのではいりました。タオルが無料でレンタルできます。', address: '万年湯', user_id: users[1].id },
    {title: '大塚記念湯', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), caption: '天井絵の迫力がすごかった。', address: '大塚記念湯', user_id: users[2].id }
  ]
)