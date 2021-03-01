class Course < ActiveRecord::Base
    has_many :posts
    has_many :students, through: :student_courses

    def slug
        name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        Course.all.find{|course| course.slug == slug}
    end

end