unit module GradeSchool:ver<1>;

class Roster is export {
    has %!students;

    method add-student(:$name, :$grade) {
        %!students.push: $name => $grade;
    }

    method list-grade(Int $grade) {
        %!students.keys.grep({%!students{$_} eq $grade}).sort;
    }

    method list-all() {
        my @list.push("Grade $_", self.list-grade($_)) for %!students.values.unique.sort;
        return @list;
    }
}
