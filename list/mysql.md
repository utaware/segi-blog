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

```sql
SELECT realname,DATE_FORMAT(str_to_date(create_time, '%Y-%m-%d %H:%i:%s'), '%Y-%m-%d %H:%i:%s') AS last_login FROM user WHERE status = '1' ORDER BY last_login DESC LIMIT 10;
SELECT  DATE_FORMAT(create_time,'%Y-%m-%d') days, count(*) as total FROM user WHERE DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= date(create_time) AND status = '1' GROUP BY days;
```

[mysql时间查询](https://www.cnblogs.com/benefitworld/p/5832897.html)