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