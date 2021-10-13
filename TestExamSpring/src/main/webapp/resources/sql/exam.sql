--------------------------------------------------------
--  DDL for DROP Data
--------------------------------------------------------

DROP SEQUENCE "M_SEQ";
DROP SEQUENCE "OB_SEQ";
DROP TABLE "M" cascade constraints;
DROP TABLE "OB" cascade constraints;

--------------------------------------------------------
--  DDL for Sequence M_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "M_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE ;

   --------------------------------------------------------
--  DDL for Sequence OB_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "OB_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10 NOCACHE  NOORDER  NOCYCLE ;

   --------------------------------------------------------
--  DDL for Table M
--------------------------------------------------------

  CREATE TABLE "M" 
   (	"M_NO" NUMBER, 
	"M_ID" VARCHAR2(200 BYTE), 
	"M_PW" VARCHAR2(400 BYTE), 
	"M_NM" VARCHAR2(200 BYTE), 
	"M_BIRTH" DATE, 
	"M_JOINDT" DATE DEFAULT SYSDATE
   ) ;

   COMMENT ON COLUMN "M"."M_NO" IS '회원번호';
   COMMENT ON COLUMN "M"."M_ID" IS '아이디';
   COMMENT ON COLUMN "M"."M_PW" IS '비밀번호';
   COMMENT ON COLUMN "M"."M_NM" IS '이름';
   COMMENT ON COLUMN "M"."M_BIRTH" IS '생일';
   COMMENT ON COLUMN "M"."M_JOINDT" IS '가입일';
   
--------------------------------------------------------
--  DDL for Table OB
--------------------------------------------------------

  CREATE TABLE "OB" 
   (	"OB_NO" NUMBER, 
	"M_NO" NUMBER, 
	"OB_CON" VARCHAR2(4000 BYTE), 
	"OB_DT" DATE DEFAULT SYSDATE, 
	"OB_DEL" NUMBER DEFAULT 1
   ) ;

   COMMENT ON COLUMN "OB"."OB_NO" IS '번호';
   COMMENT ON COLUMN "OB"."M_NO" IS '작성자번호';
   COMMENT ON COLUMN "OB"."OB_CON" IS '내용';
   COMMENT ON COLUMN "OB"."OB_DT" IS '작성일';
   COMMENT ON COLUMN "OB"."OB_DEL" IS '삭제여부';
REM INSERTING into M
SET DEFINE OFF;
Insert into M (M_NO,M_ID,M_PW,M_NM,M_BIRTH,M_JOINDT) values (1,'test1','m/RvEY2EIPPWJOafzDHF3Q==','홍길동',to_date('21/06/01','RR/MM/DD'),to_date('21/06/01','RR/MM/DD'));
Insert into M (M_NO,M_ID,M_PW,M_NM,M_BIRTH,M_JOINDT) values (2,'test2','m/RvEY2EIPPWJOafzDHF3Q==','신사임당',to_date('21/06/01','RR/MM/DD'),to_date('21/06/01','RR/MM/DD'));
REM INSERTING into OB
SET DEFINE OFF;
Insert into OB (OB_NO,M_NO,OB_CON,OB_DT,OB_DEL) values (3,2,'시험을 위하여 오신것을 환영합니다.',to_date('21/06/22','RR/MM/DD'),1);
Insert into OB (OB_NO,M_NO,OB_CON,OB_DT,OB_DEL) values (1,1,'이곳은 한줄 게시판 입니다.',to_date('21/06/22','RR/MM/DD'),1);
Insert into OB (OB_NO,M_NO,OB_CON,OB_DT,OB_DEL) values (2,1,'반갑습니다 여러분',to_date('21/06/22','RR/MM/DD'),1);
Insert into OB (OB_NO,M_NO,OB_CON,OB_DT,OB_DEL) values (4,2,'즐거운 시험시간이 되시기 바랍니다.',to_date('21/06/22','RR/MM/DD'),1);
Insert into OB (OB_NO,M_NO,OB_CON,OB_DT,OB_DEL) values (5,2,'부디 좋은 성적을 이루시길 바랍니다.',to_date('21/06/22','RR/MM/DD'),1);
Insert into OB (OB_NO,M_NO,OB_CON,OB_DT,OB_DEL) values (6,1,'This is exam case data.',to_date('21/06/22','RR/MM/DD'),1);
Insert into OB (OB_NO,M_NO,OB_CON,OB_DT,OB_DEL) values (7,1,'Good luck to you.',to_date('21/06/22','RR/MM/DD'),1);
Insert into OB (OB_NO,M_NO,OB_CON,OB_DT,OB_DEL) values (8,1,'좋은 하루 입니다.',to_date('21/06/22','RR/MM/DD'),1);
Insert into OB (OB_NO,M_NO,OB_CON,OB_DT,OB_DEL) values (9,1,'잘 보이고 있습니다.',to_date('21/06/22','RR/MM/DD'),1);

--------------------------------------------------------
--  DDL for Index M_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "M_PK" ON "M" ("M_NO") 
  ;

  --------------------------------------------------------
--  DDL for Index OB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OB_PK" ON "OB" ("OB_NO") 
  ;

  --------------------------------------------------------
--  Constraints for Table M
--------------------------------------------------------

  ALTER TABLE "M" MODIFY ("M_NO" NOT NULL ENABLE);
  ALTER TABLE "M" MODIFY ("M_ID" NOT NULL ENABLE);
  ALTER TABLE "M" MODIFY ("M_PW" NOT NULL ENABLE);
  ALTER TABLE "M" MODIFY ("M_NM" NOT NULL ENABLE);
  ALTER TABLE "M" MODIFY ("M_BIRTH" NOT NULL ENABLE);
  ALTER TABLE "M" MODIFY ("M_JOINDT" NOT NULL ENABLE);
  ALTER TABLE "M" ADD CONSTRAINT "M_PK" PRIMARY KEY ("M_NO") ENABLE;

  --------------------------------------------------------
--  Constraints for Table OB
--------------------------------------------------------

  ALTER TABLE "OB" ADD CONSTRAINT "OB_PK" PRIMARY KEY ("OB_NO") ENABLE;
  ALTER TABLE "OB" MODIFY ("OB_DEL" NOT NULL ENABLE);
  ALTER TABLE "OB" MODIFY ("OB_DT" NOT NULL ENABLE);
  ALTER TABLE "OB" MODIFY ("OB_CON" NOT NULL ENABLE);
  ALTER TABLE "OB" MODIFY ("M_NO" NOT NULL ENABLE);
  ALTER TABLE "OB" MODIFY ("OB_NO" NOT NULL ENABLE);

  --------------------------------------------------------
--  Ref Constraints for Table OB
--------------------------------------------------------

  ALTER TABLE "OB" ADD CONSTRAINT "OB_FK1" FOREIGN KEY ("M_NO")
	  REFERENCES "M" ("M_NO") ENABLE;

COMMIT;