# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
user = User.create :email => 'oldtie@163.com',  
                   :password => 'guessit', 
                   :password_confirmation => 'guessit' 
Category.create [{:name => 'Programming'}, 
                 {:name => 'News'}, 
                 {:name => 'Fun'}, 
                 {:name => 'Viewpoint'}, 
                 {:name => 'Music'}, 
                 {:name => 'Movie'}] 
