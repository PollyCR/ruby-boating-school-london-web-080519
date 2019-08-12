class Instructor
    @@all = []


     def self.all
        @@all
    end

     def initialize(name)
        @name = name
        @@all << self
    end

     attr_reader :name

     def find_student_and_test(student:, test_name:)
        BoatingTest.all.find{|test| (test.student == student) && (test.name == test_name)}
    end

     def pass_student(student:, test_name:)
        if find_student_and_test(student: student, test_name: test_name)
            find_student_and_test(student: student, test_name: test_name).status = "passed"
        else
            BoatingTest.new(instructor: self, student: student, name: test_name, status: "passed")
        end
    end

     def fail_student(student:, test_name:)
        if find_student_and_test(student: student, test_name: test_name)
            find_student_and_test(student: student, test_name: test_name).status = "failed"
        else
            BoatingTest.new(instructor: self, student: student, name: test_name, status: "failed")
        end
    end
end