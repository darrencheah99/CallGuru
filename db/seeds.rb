# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts('Destroy all Companies')
Company.destroy_all

puts('Create Company')
company = Company.create(name: 'CallGuru', email: 'fritz@callguru.de')

puts('Create Users')
manager = User.create!(email: 'fritz@callguru.de', first_name: 'Fritz', last_name: 'Meyer', password: 'FritzMeyer', dob: Date.parse('04.02.2000'), company_id: company.id)
users = User.create!([
          { email: 'darren@callguru.de', first_name: 'Darren', last_name: 'Cheah U Wei', password: 'DarrenWei', manager_id: manager.id, company_id: company.id},
          { email: 'anna@callguru.de', first_name: 'Anna', last_name: 'Haacke', password: 'AnnaHaacke', manager_id: manager.id, company_id: company.id },
          { email: 'nick@callguru.de', first_name: 'Nick', last_name: 'Michi', password: 'NickMichi', manager_id: manager.id, company_id: company.id }
        ])

puts('Create Product')
product = Product.create(name: 'CallGuru', description: 'CallGuru is made to help and guide the sales agents through their calls. By using CallGuru even the unexperienced agent seems like a professional. He/She can react to any question or objection the customer might have immediately. Furthermore CallGuru gives all kinds of valuable insights to the sales Manager on a deep level.', user_id: manager.id)

puts('Create Playbooks')
playbooks = Playbook.create!([
              { name: 'Inbound', description: 'Made for all the people and companies that registered on our landing page.', product_id: product.id },
              { name: 'Outbound', description: 'Made for all the people and companies we are actively contacting to become our partners.', product_id: product.id }
            ])

puts('Create Goals')
goals = Goal.create!([
          { title: 'develop partnership basis', playbook_id: playbooks.first.id },
          { title: 'partnership proposal', playbook_id: playbooks.first.id },
          { title: 'partnership proposal + test prototype', playbook_id: playbooks.first.id },
          { title: 'develop partnership basis', playbook_id: playbooks.last.id },
          { title: 'partnership proposal', playbook_id: playbooks.last.id },
          { title: 'partnership proposal + test prototype', playbook_id: playbooks.last.id }
        ])

puts('Create Sections')
sections = Section.create!([
             { title: 'First Base', playbook_id: playbooks.first.id },
             { title: 'Connect', playbook_id: playbooks.first.id },
             { title: 'First Pitch', playbook_id: playbooks.first.id },
             { title: 'Analyze', playbook_id: playbooks.first.id },
             { title: 'Second Pitch', playbook_id: playbooks.first.id },

             { title: 'First Base', playbook_id: playbooks.last.id },
             { title: 'Connect', playbook_id: playbooks.last.id },
             { title: 'First Pitch', playbook_id: playbooks.last.id },
             { title: 'Analyze', playbook_id: playbooks.last.id },
             { title: 'Second Pitch', playbook_id: playbooks.last.id }
           ])

puts('Create Scripts')
scripts = Script.create!([
            { title: 'First Base', content: 'Hello here is Fritz Meyer from CallGuru. Could I please be connected with XY. ...', section_id: sections.first.id },
            { title: 'Connect', content: "Hello XY, I'm Fritz Meyer from CallGuru, thank you for giving me some of your time. Would you be open to improve the performance of your agents?", section_id: sections.second.id },
            { title: 'First Pitch', content: "We're a University Project working on an interactive solution which supports sales agents during their call to make the communication between company and costumer more professional and efficient. How are we trying to achieve that? We are turning your sales script into a dynamic & intuitive guide, which will provide your agents at every time during the call with the information they need.", section_id: sections.third.id }
          ])
