require 'pg'

feature 'View all spaces' do
    scenario 'User views all spaces' do
        visit('/spaces')
        expect(page).to have_content 'The house'
    end
end

# feature 'Create a space' do
#     scenario 'User can create a space' do
#     end
# end