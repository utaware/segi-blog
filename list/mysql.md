##  重新设定表格字段自增

alter table table_name AUTO_INCREMENT=n

触发器

```sql
BEGIN
SET @user_id = new.user_id;
SET @user_name = new.username;
SET @create_time = new.create_time;
INSERT user_info (
    `user_id`, `alias`, `birthday`, `adress`, `avatar`, `phone`, `create_time`, `update_time`
) VALUES(
    @user_id, @user_name, NULL, NULL, NULL, NULL, @create_time, NULL
);
END
```