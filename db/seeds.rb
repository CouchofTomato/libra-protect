# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Admin User
User.create(email: 'admin@admin.com', password: 'password', admin: true)

# Non-admin User
User.create(email: 'user@user.com', password: 'password')