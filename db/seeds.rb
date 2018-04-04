require_relative( "../models/animal.rb" )
require_relative( "../models/owner.rb" )
require("pry-byebug")



Animal.delete_all()
Owner.delete_all()



owner1 = Owner.new({'name' => 'Jim'})
owner1.save()

owner2 = Owner.new({'name' => 'Dave'})
owner2.save()

owner3 = Owner.new({'name' => 'Steve'})
owner3.save()

animal1 = Animal.new({'name' => "Henry", 'species' => "Hippopotamus", 'adoptable' => 'Yes', 'age' => '13', 'admission_date' => '2017/12/15'})
animal1.save()

animal2 = Animal.new({'name' => "Dogbert", 'species' => "Dog", 'adoptable' => 'Yes', 'age' => '3', 'admission_date' => '2018/01/12'})
animal2.save()

animal3 = Animal.new({'name' => "Catbert", 'species' => "Cat", 'adoptable' => 'Yes', 'age' => '2', 'admission_date' => '2017/11/22'})
animal3.save()

animal4 = Animal.new({'name' => 'Edmund', 'species' => 'Elephant', 'adoptable' => 'Yes', 'age' => '22', 'admission_date' => '2017/10/13'})
animal4.save()
