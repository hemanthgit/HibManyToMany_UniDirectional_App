package com.mhk.main;

import org.hibernate.Session;

import com.mhk.model.Student;
import com.mhk.model.Subject;
import com.mhk.util.HibernateUtil;

public class Test {
	public static void main(String[] args) {
		Student student1 = new Student();
		student1.setName("Ravi");
        Student student2 = new Student();
        student2.setName("Nagarjuna");
        
        Subject subject1 = new Subject();
        subject1.setName("Physics");
        Subject subject2 = new Subject();
        subject2.setName("Politics");
        Subject subject3 = new Subject();
        subject3.setName("Economics");
 
        //Student1 have 3 subjects
        student1.getSubjects().add(subject1);
        student1.getSubjects().add(subject2);
        student1.getSubjects().add(subject3);
         
        //Student2 have 2 subjects
        student2.getSubjects().add(subject1);
        student2.getSubjects().add(subject2);
 
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
 
        session.save(student1);
        session.save(student2);
        
 // We are able to save Subject entities along with Student entities(with out calling save(subject1) like), 
//  this is because of cascade = CascadeType.ALL in Student Entity.
//   Observation : with cascading while persisting (update/delete) Student tuples, subjects tuples will also be persisted (updated/deleted).
        
        session.getTransaction().commit();
        session.close();  
	}
}
