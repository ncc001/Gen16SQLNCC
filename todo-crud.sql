CREATE TABLE "TODO" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "category" varchar UNIQUE NOT NULL,
  "description" varchar NOT NULL,
  "quantity" int NOT NULL,
  "date_start" date,
  "date_end" date,
  "is_finished" bool DEFAULT false
  
  
);



insert into "TODO"
(id,title,category,description,quantity,date_start,date_end,is_finished) values 
('e1ca287e-b624-4545-86d9-f306a2a1acfb','Buys','vegetables','artichoke','3', '2020/12/12', '2022/12/12', true ), 
('daa53213-71ea-4676-a926-2e4f06fbffd2','Buys', 'Drinks', 'water','2', '2020/12/10', '2022/12/21',false), 
('1eaa85ca-96b0-4c0a-82c4-071aad0ed7e7','Buys', 'Alcohol', 'Whisky','4', '2020/12/10', '2022/10/21',true);


select * from "TODO"  ;

select * from "TODO" where is_finished = true 