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
    {first_name: "Shelly", last_name: "Davis", email: "sdavis@email.com", password: "mypass", clinic_id: 1},
    {first_name: "Nicole", last_name: "Smith", email: "nsmith@email.com", password: "mypass", clinic_id: 1},
    {first_name: "Maxwell", last_name: "Clark", email: "maxclark@email.com", password: "mypass", clinic_id: 1},
    {first_name: "Jonathan", last_name: "Forbes", email: "jforbes@email.com", password: "mypass", clinic_id: 1},
    {first_name: "Katrina", last_name: "Ambros", email: "kambros@email.com", password: "mypass", clinic_id: 2},
    {first_name: "Alexandra", last_name: "Sperry", email: "asperry@email.com", password: "mypass", clinic_id: 2},
    {first_name: "Carly", last_name: "Connelly", email: "carlyc@email.com", password: "mypass", clinic_id: 2},
    {first_name: "Jack", last_name: "Devers", email: "jdevers@email.com", password: "mypass", clinic_id: 2},
    {first_name: "Mary", last_name: "Burke", email: "mburke@email.com" , password: "mypass", clinic_id: 3},
    {first_name: "Edward", last_name: "Barnes", email: "edbarnes@email.com" , password: "mypass", clinic_id: 3},
    {first_name: "William", last_name: "Goodridge", email: "wgoodridge@email.com" , password: "mypass", clinic_id: 3},
    {first_name: "Patricia", last_name: "Wells", email: "pwells@email.com" , password: "mypass", clinic_id: 3},
    {first_name: "Jamie", last_name: "White", email: "jwhite@email.com" , password: "mypass", clinic_id: 4},
    {first_name: "Peter", last_name: "Halls", email: "phalls@email.com" , password: "mypass", clinic_id: 4},
    {first_name: "Melanie", last_name: "Jackson", email: "melaniej@email.com" , password: "mypass", clinic_id: 4},
    {first_name: "Kelly", last_name: "Johnson", email: "kjohnson@email.com" , password: "mypass", clinic_id: 4},
    {first_name: "Bailey", last_name: "Fairday", email: "bfairday@email.com" , password: "mypass", clinic_id: 5},
    {first_name: "Jon", last_name: "Duckett", email: "jduckett@email.com" , password: "mypass", clinic_id: 5},
    {first_name: "Becky", last_name: "Amada", email: "beckya@email.com" , password: "mypass", clinic_id: 5},
    {first_name: "Susan", last_name: "Barnes", email: "susanb@email.com" , password: "mypass", clinic_id: 5},
    {first_name: "Walter", last_name: "Lawton", email: "wlawton@email.com" , password: "mypass", clinic_id: 6},
    {first_name: "Kate", last_name: "West", email: "kwest@email.com" , password: "mypass", clinic_id: 6},
    {first_name: "Diana", last_name: "Portman", email: "dportman@email.com" , password: "mypass", clinic_id: 6},
    {first_name: "Matt", last_name: "Harris", email: "mharris@email.com" , password: "mypass", clinic_id: 6},
    {first_name: "Rachael", last_name: "McKay", email: "rmckay@email.com" , password: "mypass", clinic_id: 7}
]

vets.each do |vet|
    Vet.create(vet)
end