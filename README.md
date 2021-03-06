# FurDocs

<img src="https://drive.google.com/uc?export=view&id=1adiOLJSd_6AtQ3KxCbc5hWGJci3i0q1p" width=500 height=500>

FurDocs is a CMS web app built using Ruby on Rails. FurDocs is an app for vets and pet owners that helps manage and track pet medical records.

## Functionality 

Vets can:
   - signup/login natively
   - create/edit/delete appointments for any pet
   - create/edit/delete medical charts
   - view upcoming and past appointments
   - view a list of all clinics and vets at each clinic

Pet owners can:
   - signup/login via Github (using OmniAuth)
   - create appointments for their pets with any vet
   - veiw their pets' upcoming appointment details and medical charts
   - view a list of all clinics and vets at each clinic

Possible future updates:
   - add working hours for vets
   - add open/close hours to clinics
   - include an appointments calendar to show open and booked time blocks
   - include another third party login (e.g. Google)

## Installation

Clone this repository and run:
```bundle``` then ```rake db:setup```

## Usage

Run:
```thin start --ssl``` in your terminal and visit ```https://localhost:3000``` in your browser to start the app locally.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ijanett/furdocs. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

FurDocs is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
