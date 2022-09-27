--joins---

select clients.id,first_name, last_name, email , account_no, balance from clients left join accounts on clients.id = accounts.client_id ;


select  account_no,client_id , account_types.name  from accounts right join account_types  on accounts.id = account_types.id ;

select transactions.id, amount,transactions_types.name from transactions left join transactions_types on transactions.id = transactions_types.id  ;

select transactions.id, amount,transactions_types.name from  transactions right join transactions_types on transaction_type = transactions_types.id ;



-- views--- 

create view v_clients_accounts as select clients.id,first_name, last_name, email , account_no, balance from clients left join accounts on clients.id = accounts.client_id ;
create view v_accounts_types as select  account_no,client_id , account_types.name  from accounts right join account_types  on accounts.id = account_types.id ;
create view v_transactions_detail as select transactions.id, amount,transactions_types.name from transactions left join transactions_types on transactions.id = transactions_types.id  ;
create view v_transations_types_detail as select transactions.id, amount,transactions_types.name from  transactions right join transactions_types on transaction_type = transactions_types.id ;


select * from v_clients_accounts;
select * from v_accounts_types;
select * from v_transactions_detail;
select * from v_transations_types_detail;


