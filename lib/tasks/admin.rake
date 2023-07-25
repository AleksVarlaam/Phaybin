# frozen_string_literal: true

namespace :admin do
  # Languages
  desc 'Start'
  task start: :environment do
    # Create Admin
    if Admin.exists?
      p 'Admin already exists!'
    else
      admins_array = [
        { email: 'phaybin@gmail.com', password: '07Bubochki06Tamid20', password_confirmation: '07Bubochki06Tamid20' },
        { email: 'aleksvarlaam@gmail.com', password: '1UhsX7Rp', password_confirmation: '1UhsX7Rp' }
      ]

      admins_array.each { |admin| Admin.create(admin) }

      # galleries_array = [
#         { ru: 'Главная-mobile', en: 'Main-mobile', uk: 'Головна-mobile', he: 'mobile-ראשי' },
#         { ru: 'Главная-desktop', en: 'Main-desktop', uk: 'Головна-desktop', he: 'desktop-ראשי' }
#       ]
#
#       galleries_array.each { |gallery| Gallery.create(gallery) }

      p "Created #{Admin.count} admins and #{Gallery.count} galleries"
    end
  end
end
