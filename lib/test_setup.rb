require 'pg'

def clear_test_db
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("TRUNCATE users, spaces;")
    #connection.exec("TRUNCATE users;")
end