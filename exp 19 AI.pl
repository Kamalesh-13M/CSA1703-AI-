% student(StudentName, StudentID).
student(ram, s101).
student(jaya, s102).
student(anita, s103).

% teacher(TeacherName, TeacherID).
teacher(vijay, t201).
teacher(kavita, t202).

% subject(SubjectCode, SubjectName).
subject(cs501, 'Artificial Intelligence').
subject(cs502, 'Computer Networks').

% teaches(TeacherID, SubjectCode).
teaches(t201, cs501).
teaches(t202, cs502).

% enrolled(StudentID, SubjectCode).
enrolled(s101, cs501).
enrolled(s102, cs501).
enrolled(s103, cs502).
