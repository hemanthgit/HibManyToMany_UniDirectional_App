# HibManyToMany_UniDirectional_App

We are discussing an example of Student and Subject relationship. 
A student can enroll for multiple subject. And a subject can have multiple students enrolled for it.
We are considering Unidirectional mapping, means only Student to Subject entity navigation is possible.

Subject is a plain POJO, with no details of Student.On the other hand, in Student, we have defined following extra

@ManyToMany(cascade = CascadeType.ALL)
@JoinTable(name = "STUDENT_SUBJECT", 
           joinColumns = { @JoinColumn(name = "STUDENT_ID") }, 
           inverseJoinColumns = { @JoinColumn(name = "SUBJECT_ID") })
private List<Subject> subjects = new ArrayList<Subject>();


@ManyToMany indicates that there is a Many-to-Many relationship between Student and subject. 
A Student can enroll for multiple subjects, and a subject can have multiple students enrolled.
Notice cascade = CascadeType.ALL, with cascading while persisting (update/delete) Student tuples,
subjects tuples will also be persisted (updated/deleted).

@JoinTable indicates that there is a link table which joins two tables via containing there keys.
This annotation is mainly used on the owning side of the relationship.
@joinColumns refers to the column name of owning side(STUDENT_ID of STUDENT), 
and inverseJoinColumns refers to the column of inverse side of relationship(SUBJECT_ID of SUBJECT).
Primary key of this joined table is combination of STUDENT_ID & SUBJECT_ID.
