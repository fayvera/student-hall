class Student < ActiveRecord::Base
    has_secure_password
    has_many :posts
    has_many :student_courses
    has_many :courses, through: :student_courses

    validates_uniqueness_of(:email)
    def slug
        name = first_name + last_name
        name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        Student.all.find{|student| student.slug == slug}
    end

end