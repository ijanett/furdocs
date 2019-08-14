# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

clinics = [
    {name: "Queenstowne Cat Clinic", location: "Alexandria, Virginia", description: "We're commited to delivering quality medical and surgical care for your cats."},
    {name: "Brooks Animal Clinic", location: "Fairfax, Virginia", description: "Our veterinarians and staff are dedicated to your pet's health."},
    {name: "Petfield Clinic", location: "Dale City, Virginia", description: "We care for you and your companion and will work with you to help you understand your pet's health needs."},
    {name: "Parkway Animal Clinic", location: "Fairfax, Virginia", description: "Providing comprehensive medical, surgical, and dental care for our pet-patients since 1980."},
    {name: "Paradise Animal Clinic", location: "Gardenstowne, Virginia", description: "A warm and inviting atmosphere combined with the latest in veterinary medicine and surgery, Paradise Animal Clinic offers an exceptional concept in animal care."},
    {name: "Clinic of Internal Medicine", location: "Burke, Virginia", description: "Our board certified internal medicine vets have an extensive background in evaluation, diagnosis and treatment of internal medicine conditions in cats and dogs"},
    {name: "Wags n Kisses Dog Clinic", location: "Alexandria, Virginia", description: "We are dedicated to delivering the highest possible service to ensure the quality of life and well being of your dog."},
]

clinics.each do |clinic|
    Clinic.create(clinic)
end


vets = [
    {first_name: "Shelly", last_name: "Davis", email: "sdavis@email.com", password: "mypass", password_confirmation: "mypass", clinic_id: 1},
    {first_name: "Nicole", last_name: "Smith", email: "nsmith@email.com", password: "mypass", password_confirmation: "mypass", clinic_id: 1},
    {first_name: "Maxwell", last_name: "Clark", email: "maxclark@email.com", password: "mypass", password_confirmation: "mypass", clinic_id: 1},
    {first_name: "Jonathan", last_name: "Forbes", email: "jforbes@email.com", password: "mypass", password_confirmation: "mypass", clinic_id: 1},
    {first_name: "Katrina", last_name: "Ambros", email: "kambros@email.com", password: "mypass", password_confirmation: "mypass", clinic_id: 2},
    {first_name: "Alexandra", last_name: "Sperry", email: "asperry@email.com", password: "mypass", password_confirmation: "mypass", clinic_id: 2},
    {first_name: "Carly", last_name: "Connelly", email: "carlyc@email.com", password: "mypass", password_confirmation: "mypass", clinic_id: 2},
    {first_name: "Jack", last_name: "Devers", email: "jdevers@email.com", password: "mypass", password_confirmation: "mypass", clinic_id: 2},
    {first_name: "Mary", last_name: "Burke", email: "mburke@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 3},
    {first_name: "Edward", last_name: "Barnes", email: "edbarnes@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 3},
    {first_name: "William", last_name: "Goodridge", email: "wgoodridge@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 3},
    {first_name: "Patricia", last_name: "Wells", email: "pwells@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 3},
    {first_name: "Jamie", last_name: "White", email: "jwhite@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 4},
    {first_name: "Peter", last_name: "Halls", email: "phalls@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 4},
    {first_name: "Melanie", last_name: "Jackson", email: "melaniej@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 4},
    {first_name: "Kelly", last_name: "Johnson", email: "kjohnson@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 4},
    {first_name: "Bailey", last_name: "Fairday", email: "bfairday@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 5},
    {first_name: "Jon", last_name: "Duckett", email: "jduckett@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 5},
    {first_name: "Becky", last_name: "Amada", email: "beckya@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 5},
    {first_name: "Susan", last_name: "Barnes", email: "susanb@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 5},
    {first_name: "Walter", last_name: "Lawton", email: "wlawton@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 6},
    {first_name: "Kate", last_name: "West", email: "kwest@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 6},
    {first_name: "Diana", last_name: "Portman", email: "dportman@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 6},
    {first_name: "Matt", last_name: "Harris", email: "mharris@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 6},
    {first_name: "Rachael", last_name: "McKay", email: "rmckay@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 7},
    {first_name: "Frank", last_name: "Adams", email: "frankadams@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 7},
    {first_name: "Julia", last_name: "Banks", email: "jbanks@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 7},
    {first_name: "Allsion", last_name: "Parker", email: "aparker@email.com" , password: "mypass", password_confirmation: "mypass", clinic_id: 7}
]

vets.each do |vet|
    Vet.create(vet)
end


owners = [
    {first_name: "David", last_name: "Mejia", email: "davidm@email.com", uid: "9000", provider: "github"},
    {first_name: "Crystal", last_name: "White", email: "cwhite@email.com", uid: "9001", provider: "github"},
    {first_name: "Emily", last_name: "Moreno", email: "emoreno@email.com", uid: "9001", provider: "github"},
    {first_name: "Lilly", last_name: "Stewart", email: "lstewart@email.com", uid: "9002", provider: "github"},
    {first_name: "Karina", last_name: "Moreno", email: "karinam@email.com", uid: "9003", provider: "github"},
    {first_name: "Kim", last_name: "Young", email: "kyoung@email.com", uid: "9004", provider: "github"},
    {first_name: "Jenny", last_name: "Lopez", email: "jlopez@email.com", uid: "9005", provider: "github"},
    {first_name: "Andy", last_name: "Mineo", email: "andym@email.com", uid: "9006", provider: "github"},
    {first_name: "Alex", last_name: "Grant", email: "alexg@email.com", uid: "9007", provider: "github"},
    {first_name: "Isaiah", last_name: "Earl", email: "iearl@email.com", uid: "9008", provider: "github"},
    {first_name: "Alfred", last_name: "Brown", email: "alfbrown@email.com", uid: "9009", provider: "github"}
]

owners.each do |owner|
    Owner.create(owner)
end


pets = [
    {name: "Bear", color: "Red", breed: "Chow Chow", dob: "2014-04-15", gender: 0, owner_id: 3},
    # {name: "Meatball", color: "Tan", breed: "French Bulldog", dob: "2013-07-05", gender: 0, owner_id: 12},
    {name: "Oreo", color: "Black & White", breed: "Dalmatian", dob: "2016-03-12", gender: 0, owner_id: 6},
    {name: "Lucky", color: "White & Tan", breed: "Jack Russell Terrier", dob: "2015-09-20", gender: 0, owner_id: 7},
    {name: "Bubba", color: "Tri Color", breed: "Bernedoodle", dob: "2017-06-17", gender: 0, owner_id: 10},
    {name: "Toby", color: "White", breed: "Bull Terrier", dob: "2018-08-18", gender: 0, owner_id: 2},
    {name: "Tiger", color: "Brown Mackerel", breed: "Toyger", dob: "2015-06-20", gender: 0, owner_id: 2},
    {name: "Pearl", color: "White", breed: "Exotic Shorthair", dob: "2013-10-02", gender: 1, owner_id: 8},
    {name: "Shadow", color: "Black", breed: "Bombay", dob: "2014-03-15", gender: 1, owner_id: 6},
    {name: "Garfield", color: "Tabby", breed: "Exotic Shorthair", dob: "2012-11-03", gender: 0, owner_id: 9},
    {name: "Smoky", color: "Gray", breed: "Scottish Fold", dob: "2019-01-01", gender: 0, owner_id: 6},
    {name: "Lady", color: "Orange", breed: "Pomeranian", dob: "2013-05-11", gender: 1, owner_id: 5},
    {name: "Wiley", color: "Black & White", breed: "Border Collie", dob: "2017-08-12", gender: 0, owner_id: 10},
    {name: "Chester", color: "Tan", breed: "Coonhound", dob: "2016-02-10", gender: 0, owner_id: 7},
    {name: "Odie", color: "Tri Color", breed: "Beagle", dob: "2016-02-07", gender: 0, owner_id: 6},
    {name: "Olive", color: "Black", breed: "Chihuahua", dob: "2014-09-03", gender: 1, owner_id: 8},
    {name: "Onyx", color: "Black", breed: "Cocker Spaniel", dob: "2017-08-01", gender: 1, owner_id: 7},
    {name: "Bozo", color: "White", breed: "American Curl", dob: "2018-06-24", gender: 0, owner_id: 11},
    {name: "Bugsy", color: "Tan", breed: "Pug", dob: "2015-04-14", gender: 0, owner_id: 11},
    {name: "Dash", color: "Fawn", breed: "Greyhound", dob: "2018-05-18", gender: 0, owner_id: 11},
    {name: "Bean", color: "Red", breed: "Bloodhound", dob: "2017-07-19", gender: 0, owner_id: 3},
    {name: "Hunter", color: "Sable & White", breed: "Alaskan Malamute", dob: "2018-03-18", gender: 0, owner_id: 8},
    {name: "Coco", color: "Light Brown", breed: "Shih Tzu", dob: "2016-04-21", gender: 1, owner_id: 3},
    {name: "Charlie", color: "Chocolate", breed: "American Water Spaniel", dob: "2013-05-12", gender: 0, owner_id: 6},
    {name: "Odin", color: "Apricot", breed: "Poodle", dob: "2014-06-15", gender: 0, owner_id: 9},
    {name: "Cinnamon", color: "Chocolate & Tan", breed: "Dachshund", dob: "2016-02-08", gender: 1, owner_id: 5},
    {name: "Dex", color: "Cream", breed: "Cymric", dob: "2017-07-04", gender: 0, owner_id: 9},
    {name: "Joy", color: "Spotted Golden", breed: "Savannah", dob: "2017-09-01", gender: 1, owner_id: 8},
    # {name: "Junebug", color: "Brown", breed: "Chesapeake Bay Retriever", dob: "2018-06-17", gender: 1, owner_id: 12},
    {name: "Fluffy", color: "White", breed: "Samoyed", dob: "2016-08-16", gender: 1, owner_id: 4},
    {name: "Hamlet", color: "Tan", breed: "Sphynx", dob: "2019-02-20", gender: 0, owner_id: 4},
    {name: "Snowy", color: "White", breed: "Turkish Angora", dob: "2017-01-12", gender: 1, owner_id: 4},
    {name: "Remy", color: "Cream", breed: "Borzoi", dob: "2018-03-07", gender: 0, owner_id: 9},
    # {name: "Cooper", color: "Black", breed: "Newfoundland", dob: "2016-05-12", gender: 0, owner_id: 12},
    {name: "Nugget", color: "Golden", breed: "Golden Retriever", dob: "2014-12-08", gender: 0, owner_id: 4},
]

pets.each do |pet|
    Pet.create(pet)
end