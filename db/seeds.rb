# frozen_string_literal: true

User.create!(email: 'admin@example.com', password: 'password', role: 'admin') unless User.exists?(email: 'admin@example.com')

