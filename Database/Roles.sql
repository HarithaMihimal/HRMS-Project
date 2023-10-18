create role 'developer';

grant select,update on hrms.* to  'developer';

create user 'developer_user'@'localhost' identified by 'password1234';

grant 'developer' to 'developer_user'@'localhost';

flush privileges;