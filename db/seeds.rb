require_relative( "../models/animal.rb" )
require_relative( "../models/owner.rb" )
require("pry-byebug")



Animal.delete_all()
Owner.delete_all()



owner1 = Owner.new({'name' => 'Jim'})
owner1.save()

owner2 = Owner.new({'name' => 'Dave'})
owner2.save()

animal1 = Animal.new({'name' => "Henry", 'species' => "Hippopotamus", 'adoptable' => 'Yes', 'age' => '13', 'admission_date' => 'December 2017'})
animal1.save()

animal2 = Animal.new({'name' => "Dogbert", 'species' => "dog", 'adoptable' => 'Yes', 'age' => '3', 'admission_date' => 'January 2018'})
animal2.save()

animal3 = Animal.new({'name' => "Catbert", 'species' => "cat", 'adoptable' => 'Yes', 'age' => '2', 'admission_date' => 'November 2017'})
animal3.save()
