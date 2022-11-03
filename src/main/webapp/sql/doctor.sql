create table TBL_DOCTOR_01 (
    dcode char(4) not null,
    dname varchar2(20),
    dgender char(1),
    dsubj varchar2(20),
    dept varchar2(20),
    dpos varchar2(10),
    demail varchar2(20),
    primary key(dcode)
);


create table TBL_RESERVE_01 (
    rno char(4) not null,
    rbirth char(7),
    rname varchar2(20),
    rphone varchar2(11),
    rdate char(8),
    dcode char(4),
    primary key(rno)
);


insert into TBL_DOCTOR_01
values('D001', '김의사', 'M', '내분비', '내과', '센터장', 'aaa@hrd.co.kr');
insert into TBL_DOCTOR_01
values('D002', '박의사', 'M', '감암', '외과', '과장', 'bbb@hrd.co.kr');
insert into TBL_DOCTOR_01
values('D003', '정의사', 'F', '일반', '산부인과', '실장', 'ccc@hrd.co.kr');
insert into TBL_DOCTOR_01
values('D004', '최의사', 'M', '교정', '치과', '과장', 'ddd@hrd.co.kr');
insert into TBL_DOCTOR_01
values('D005', '신의사', 'M', '무릎', '정형외과', '과장', 'eee@hrd.co.kr');
insert into TBL_DOCTOR_01
values('D006', '강의사', 'F', '각막', '안과', '실장', 'fff@hrd.co.kr');



insert into TBL_RESERVE_01
values('2201', '9901011', '김환자', '01011111010', '20220502', 'D001');
insert into TBL_RESERVE_01
values('2202', '9902011', '이환자', '01011111011', '20220502', 'D001');
insert into TBL_RESERVE_01
values('2203', '9903012', '박환자', '01011111012', '20220502', 'D002');
insert into TBL_RESERVE_01
values('2204', '9904011', '최환자', '01011111013', '20220502', 'D001');
insert into TBL_RESERVE_01
values('2205', '9905012', '유환자', '01011111014', '20220503', 'D003');
insert into TBL_RESERVE_01
values('2206', '9906011', '황환자', '01011111015', '20220504', 'D003');
insert into TBL_RESERVE_01
values('2207', '9907011', '왕환자', '01011111016', '20220505', 'D004');
insert into TBL_RESERVE_01
values('2208', '9908011', '주환자', '01011111017', '20220506', 'D005');
insert into TBL_RESERVE_01
values('2209', '9909012', '진환자', '01011111018', '20220509', 'D006');
insert into TBL_RESERVE_01
values('2210', '9910012', '홍환자', '01011111019', '20220510', 'D005');



SELECT rno, rbirth, rname, rphone, rdate, AA.dcode, dname, dgender, dsubj, dept, dpos, demail 
FROM TBL_RESERVE_01 AA INNER JOIN TBL_DOCTOR_01 BB
ON AA.dcode=BB.dcode


SELECT rno,  AA.dcode, dname 
FROM TBL_RESERVE_01 AA INNER JOIN TBL_DOCTOR_01 BB
ON AA.dcode=BB.dcode







