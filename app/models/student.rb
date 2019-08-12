class Student 
    attr_reader :first_name

@@all = []
    def self.all
    @@all
end

 def initialize(first_name:)
    @first_name = first_name
    @@all << self
end

 def add_boating_test(test_name:, test_status:, instructor:)
    BoatingTest.new(student: self, name: test_name, status: test_status, instructor: instructor)
end

 def self.find_student(first_name:)
    @@all.find{|student| student.first_name == first_name}
end

 def get_tests
    BoatingTest.all.select{|test| test.student == self}
end

 def find_passed
    get_tests.select{|test| test.status == "passed"}
end

 def grade_percentage
    (find_passed.count.to_f / get_tests.count.to_f) * 100.0
end
end