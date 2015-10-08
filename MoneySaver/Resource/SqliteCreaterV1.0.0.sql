/* MoneySaver 数据库版本: 1.0 */
/*建表*/



/*创建用户信息缓存 */
/*图像缓存为URL,设置SDImage缓存时间为永久*/

CREATE TABLE IF NOT EXISTS MSAccountDataModel (
    objectId text PRIMARY KEY NOT NULL,
    account text(128),
    monthLimit double(128),
    userImage text(128)
);

/*创建项目信息缓存*/
/*日期格式: YYYY-MM-DD hh:mm:ss*/

CREATE TABLE IF NOT EXISTS MSBaseProjectModel (
    objectId text PRIMARY KEY NOT NULL,
    transactionType integer,
    projectType integer,
    date text(128),
    name text(128),
    value double(128),
    note text(128),
    sourceId text(128)
);

/*创建来源信息缓存*/

CREATE TABLE IF NOT EXISTS MSMoneySourceModel (
    objectId integer PRIMARY KEY NOT NULL,
    sourceType double(128),
    sourceName text(128),
    total double(128)
);


