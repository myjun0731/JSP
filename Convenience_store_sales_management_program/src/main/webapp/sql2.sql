-- 상품 테이블 (products)
create table products (
    product_id number(6) not null primary key,  -- 상품 코드
    product_name varchar2(30),                  -- 상품명
    price number(8),                            -- 판매 가격
    cost number(8),                             -- 원가
    stock_quantity number(6),                   -- 재고 수량
    entry_date date                             -- 입고일자
);

-- 매장 테이블 (stores)
create table stores (
    store_id varchar2(5) not null primary key,  -- 매장 코드
    store_name varchar2(20),                    -- 매장명
    store_type varchar2(1)                      -- 매장 구분 (A, B, C 등)
);

-- 판매 테이블 (sales)
create table sales (
    sale_id varchar2(4) not null primary key,   -- 판매 번호
    sale_date date not null,                    -- 판매 일자
    sale_type varchar2(1) not null,             -- 판매 구분 (1: 판매, 2: 취소)
    store_id varchar2(5),                       -- 매장 코드
    product_id number(6),                       -- 상품 코드
    sale_quantity number(3),                    -- 판매 수량
    payment_type varchar2(2),                   -- 결제 방식 (01: 현금, 02: 카드)
    foreign key(store_id) references stores(store_id),     -- 매장 참조
    foreign key(product_id) references products(product_id) -- 상품 참조
);

-- 상품 테이블 (products)
create table products (
    product_id number(6) not null primary key,
    product_name varchar2(30),
    price number(8),
    cost number(8),
    stock_quantity number(6),
    entry_date date
);

-- 매장 테이블 (stores)
create table stores (
    store_id varchar2(5) not null primary key,
    store_name varchar2(20),
    store_type varchar2(1)
);

-- 판매 테이블 (sales)
create table sales (
    sale_id varchar2(4) not null primary key,
    sale_date date not null,
    sale_type varchar2(1) not null,
    store_id varchar2(5),
    product_id number(6),
    sale_quantity number(3),
    payment_type varchar2(2),
    foreign key(store_id) references stores(store_id),
    foreign key(product_id) references products(product_id)
);



insert into products (product_id, product_name, price, cost, entry_date, stock_quantity) 
values (110001, '라면', 1050, 750, '2019-03-02', 100);

insert into products (product_id, product_name, price, cost, entry_date, stock_quantity) 
values (110002, '빵', 1300, 800, '2019-03-02', 200);

insert into products (product_id, product_name, price, cost, entry_date, stock_quantity) 
values (110003, '과자', 2000, 1700, '2019-03-02', 150);

insert into products (product_id, product_name, price, cost, entry_date, stock_quantity) 
values (110004, '탄산음료', 900, 750, '2019-03-02', 300);

insert into products (product_id, product_name, price, cost, entry_date, stock_quantity) 
values (110005, '삼각김밥', 750, 300, '2019-03-02', 500);

insert into products (product_id, product_name, price, cost, entry_date, stock_quantity) 
values (110006, '초콜릿', 1500, 1300, '2019-03-02', 200);

insert into products (product_id, product_name, price, cost, entry_date, stock_quantity) 
values (110007, '우유', 850, 600, '2019-03-02', 400);


insert into stores (store_id, store_name, store_type) 
values ('A001', '이태원점', '0');

insert into stores (store_id, store_name, store_type) 
values ('A002', '한남점', '0');

insert into stores (store_id, store_name, store_type) 
values ('A003', '도원점', '0');

insert into stores (store_id, store_name, store_type) 
values ('B001', '혜화점', '1');

insert into stores (store_id, store_name, store_type) 
values ('C001', '방배점', '1');

insert into stores (store_id, store_name, store_type) 
values ('D001', '사당점', '0');

insert into stores (store_id, store_name, store_type) 
values ('D002', '흑석점', '1');

insert into stores (store_id, store_name, store_type) 
values ('E001', '금호점', '0');


insert into sales (sale_id, sale_date, sale_type, store_id, product_id, sale_quantity, payment_type) 
values ('0001', '2019-03-25', '1', 'A001', 110001, 2, '02');

insert into sales (sale_id, sale_date, sale_type, store_id, product_id, sale_quantity, payment_type) 
values ('0002', '2019-03-25', '1', 'B001', 110003, 2, '02');

insert into sales (sale_id, sale_date, sale_type, store_id, product_id, sale_quantity, payment_type) 
values ('0003', '2019-03-25', '1', 'D001', 110003, 1, '01');

insert into sales (sale_id, sale_date, sale_type, store_id, product_id, sale_quantity, payment_type) 
values ('0004', '2019-03-25', '1', 'A001', 110006, 5, '02');

insert into sales (sale_id, sale_date, sale_type, store_id, product_id, sale_quantity, payment_type) 
values ('0005', '2019-03-25', '1', 'C001', 110006, 2, '02');

insert into sales (sale_id, sale_date, sale_type, store_id, product_id, sale_quantity, payment_type) 
values ('0006', '2019-03-25', '2', 'C001', 110003, 2, '02');

insert into sales (sale_id, sale_date, sale_type, store_id, product_id, sale_quantity, payment_type) 
values ('0007', '2019-03-25', '1', 'A002', 110005, 4, '02');

insert into sales (sale_id, sale_date, sale_type, store_id, product_id, sale_quantity, payment_type) 
values ('0008', '2019-03-25', '1', 'A003', 110004, 4, '02');

insert into sales (sale_id, sale_date, sale_type, store_id, product_id, sale_quantity, payment_type) 
values ('0009', '2019-03-25', '1', 'B001', 110001, 2, '01');

insert into sales (sale_id, sale_date, sale_type, store_id, product_id, sale_quantity, payment_type) 
values ('0010', '2019-03-25', '1', 'A002', 110006, 1, '02');


create sequence Jongchan
increment by 1
start with 11;

create sequence dawon
increment by 1
start with 110008;

<--List-->
select goods_cd, goods_nm, goods_price, cost, in_date 
from tbl_goods_02;

<--ListEditConfirm-->
update tbl_goods_02 set goods_nm = ?, goods_price = ?, cost = ?, in_date = ? 
where goods_cd = ?;

<--ListRegi-->
select max(goods_cd)+1, sysdate 
from tbl_goods_02;

<--ListRegiConfirm-->
insert into tbl_goods_02 values(?, ?, ?, ?, ?);

<--Regi-->
select max(sale_no)+1, sysdate 
from sale_tbl_004 
ikgroup by sysdate;

<--RegiConfirm-->
insert into sale_tbl_004 values(?, ?, ?, ?, ?, ?, ?);

<--Result-->
select st.store_nm as 점포명, 
sum(case when sa.pay_type = '01' then sa.sale_cnt * go.goods_price ELSE 0 END) as 현금매출, 
sum(case when sa.pay_type = '02' then sa.sale_cnt * go.goods_price ELSE 0 END) as 카드매출, 
sum(sa.sale_cnt * go.goods_price) as 총매출 
from sale_tbl_004 sa, store_tbl_004 st, tbl_goods_02 go 
where go.goods_cd = sa.goods_cd and sa.store_cd = st.store_cd 
group by st.store_nm 
order by SUM(sa.sale_cnt * go.goods_price) desc;

<--ResultConfirm-->
select st.store_nm, 
sa.sale_fg, sa.sale_no, sa.sale_ymd, go.goods_nm, sa.sale_cnt, 
SUM(sa.sale_cnt * go.goods_price), 
sa.pay_type 
from sale_tbl_004 sa, store_tbl_004 st, tbl_goods_02 go 
where go.goods_cd = sa.goods_cd and sa.store_cd = st.store_cd 
group by st.store_nm, sa.sale_fg, sa.sale_no, sa.sale_ymd, go.goods_nm, sa.sale_cnt, sa.pay_type 
order by sa.pay_type;