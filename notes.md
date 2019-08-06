    MODELS
Vet
has_many :appointments
has_many :pets, through: :appointments

Pet
belongs_to :owner
has_many :records
has_many :appointments
has_many :vets, through: :appointments

Appointment
belongs_to :vet
belongs_to :pet

PetRecord
belongs_to :pet

Owner
has_many :pets


    SCHEMA
:vets
string:first_name
string:last_name
string:email
string:password_digest

:owners
string:first_name
string:last_name
string:email
string:password_digest

:pets
integer:owner_id
string:name
string:color
string:breed
date:dob
string:sex
integer:age
integer:weight


:appointments
integer:vet_id
integer:pet_id
datetime:appointment_date

:pet_records
integer:pet_id
boolean:vaccination
boolean:prescription
boolean:diagnosis
text:message


OR

:users
string:first_name
string:last_name
string:email
string:password_digest
boolean:vet, default: false
