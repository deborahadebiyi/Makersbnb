feature 'sign up ' do 
    scenario 'the user enter the correct username and password' do 
        sign_up('test', 'test')
        expect(current_path).to eq '/options'
    end 

    scenario 'the username is taken' do 
        sign_up('test', 'test')
        sign_up('test', 'testing')
        expect(current_path).to eq '/'
    end
end 
