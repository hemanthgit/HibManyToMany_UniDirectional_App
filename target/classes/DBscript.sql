--------------------------------------------------------
--  DDL for Table STUDENT
--------------------------------------------------------
  CREATE TABLE "STUDENT" (	"ID" NUMBER, "NAME" VARCHAR2(20 BYTE))  ;
--------------------------------------------------------
--  DDL for Table SUBJECT
--------------------------------------------------------
  CREATE TABLE "SUBJECT" (	"ID" NUMBER,"NAME" VARCHAR2(63 BYTE)) ;
--------------------------------------------------------
--  DDL for Table STUDENT_SUBJECT
--------------------------------------------------------
  CREATE TABLE "STUDENT_SUBJECT" ("STU_ID" NUMBER, "SUB_ID" NUMBER ) ;
--------------------------------------------------------
--  DDL for Index STUDENT_PK
--------------------------------------------------------
  CREATE UNIQUE INDEX "STUDENT_PK" ON "STUDENT" ("ID");
--------------------------------------------------------
--  DDL for Index SUBJECT_PK
--------------------------------------------------------
  CREATE UNIQUE INDEX "SUBJECT_PK" ON "SUBJECT" ("ID");
--------------------------------------------------------
--  Constraints for Table STUDENT
--------------------------------------------------------
  ALTER TABLE "STUDENT" ADD CONSTRAINT "STUDENT_PK" PRIMARY KEY ("ID");
  ALTER TABLE "STUDENT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SUBJECT
--------------------------------------------------------
  ALTER TABLE "SUBJECT" ADD CONSTRAINT "SUBJECT_PK" PRIMARY KEY ("ID");
  ALTER TABLE "SUBJECT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table STUDENT_SUBJECT
--------------------------------------------------------
  ALTER TABLE "STUDENT_SUBJECT" ADD CONSTRAINT "STUDENT_FK" FOREIGN KEY ("STU_ID")  REFERENCES "STUDENT" ("ID") ENABLE;
  ALTER TABLE "STUDENT_SUBJECT" ADD CONSTRAINT "SUBJECT_FK" FOREIGN KEY ("SUB_ID")  REFERENCES "SUBJECT" ("ID") ENABLE;
