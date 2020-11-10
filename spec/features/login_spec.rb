feature 'logging in ' do 
    scenario 'the user enter the correct username and password' do 
        sign_up('test', 'test')
        log_in('test', 'test')
        expect(current_path).to eq '/options'
    end 
    scenario 'the user enter the wrong password' do 
        sign_up('test', 'test')
        log_in('test', 'testing')
        expect(current_path).to eq '/'
    end 
    scenario 'the user doesnt exist' do 
        log_in('test', 'test')
        expect(current_path).to eq '/'
    end
end 
