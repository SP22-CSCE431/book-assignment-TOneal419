# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do

  scenario 'valid inputs First test' do
    visit new_book_path
    fill_in 'Title', with: 'Lord of the rings'
    fill_in 'Author', with: 'this thing exists'
    fill_in 'Price', with: '725'
    click_on 'Create Book'
    visit books_path

    expect(page).to have_content('Lord of the rings')
    
    expect(page).to have_content('this thing exists')

    expect(page).to have_content('725')
  end

  scenario 'valid inputs integrate date' do
    visit new_book_path
    fill_in 'Title', with: 'BluesClues'
    fill_in 'Price', with: '2'
    fill_in 'Author', with: 'Author here'
    
    select '2020', :from => 'book_published_date_1i'
    select 'December', :from => 'book_published_date_2i'
    select '31', :from => 'book_published_date_3i'

    click_on 'Create Book'
    visit books_path

    expect(page).to have_content('BluesClues')
    expect(page).to have_content('2020-12-31')
    expect(page).to have_content('Author here')

    
  end
  
  scenario 'valid inputs title author and price' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'jk'
    fill_in 'Price', with: '35'
    click_on 'Create Book'
    visit books_path

    expect(page).to have_content('harry potter')
    expect(page).to have_content('35.0')
    expect(page).to have_content('jk')
  end

  scenario 'valid inputs all' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Price', with: '35'
    fill_in 'Author', with: 'jk'
    select '2021', :from => 'book_published_date_1i'
    select 'January', :from => 'book_published_date_2i'
    select '31', :from => 'book_published_date_3i'
    click_on 'Create Book'
    visit books_path

    expect(page).to have_content('harry potter')
    expect(page).to have_content('35.0')
    expect(page).to have_content('jk')
    expect(page).to have_content('2021-01-31')
  end
end
