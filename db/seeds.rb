User.where(name: 'Troy Van Leeuwen', email: 'troy@fender.com').first_or_create(password: 'jazzmaster')
User.where(name: 'Jimi Hendrix', email: 'jimi@fender.com').first_or_create(password: 'stratocaster')
