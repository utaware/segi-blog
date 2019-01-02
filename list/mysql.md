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

```sql
SELECT `Privilege`.`id`, `Privilege`.`type`, `Privilege`.`remark`, `Privilege`.`leve
l`, `u`.`user_id` AS `u.user_id`, `u`.`username` AS `u.username`, `u`.`hash` AS
`u.hash`, `u`.`email` AS `u.email`, `u`.`privilege` AS `u.privilege`, `u`.`role`
 AS `u.role`, `u`.`login_time` AS `u.login_time`, `u`.`created_at` AS `u.created
_at`, `u`.`updated_at` AS `u.updated_at`, `u`.`deleted_at` AS `u.deleted_at` FRO
M `privilege_list` AS `Privilege` LEFT OUTER JOIN `user_list` AS `u` ON `Privile
ge`.`id` = `u`.`privilege` AND (`u`.`deleted_at` > '2019-01-02 15:40:12' OR `u`.
`deleted_at` IS NULL) WHERE (`Privilege`.`deleted_at` > '2019-01-02 15:40:12' OR
 `Privilege`.`deleted_at` IS NULL);
```

```JSON
[
      {
        "id": 1,
        "name": "开发规范",
        "desc": "开发规范描述",
        "type": "doc_standard",
        "ra": [
            {
                "docs": "css开发规范",
                "category": 0
            }
        ]
      },
      {
        "id": 2,
        "name": "测试规范",
        "desc": "测试规范描述",
        "type": "test_standard",
        "ra": [
            {
                "docs": "css开发规范",
                "category": 0
            },
            {
                "docs": "test",
                "category": 0
            }
        ]
      },
      {
        "id": 3,
        "name": "组件文档",
        "desc": "组件文档描述",
        "type": "com_doc",
        "ra": [
            {
                "docs": "组件文档1",
                "category": 1
            },
            {
                "docs": "组件文档2",
                "category": 1
            }
        ]
      },
      {
        "id": 4,
        "name": "每周分享",
        "desc": "每周分析描述",
        "type": "share_desc",
        "ra": [
            {
                "docs": "每周分享1",
                "category": 0
            },
            {
                "docs": "每周分享2",
                "category": 0
            }
        ]
      },
      {
        "id": 5,
        "name": "工具推荐",
        "desc": "工具推荐描述",
        "type": "tools_desc",
        "ra": [
            {
                "docs": "工具推荐2",
                "category": 0
            }
        ]
      },
      {
        "id": 6,
        "name": "其它",
        "desc": "其它描述",
        "type": "others",
        "ra": [
            {
                "docs": "其他1",
                "category": 0
            }
        ]
      }
    ]
```