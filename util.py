from pymysql import *
import pymysql

# conn = connect(host='localhost', user='root', password='123456', database='', port=3306)
# cursor = conn.cursor()
db_config = {
    'host': '123.249.112.89',
    'user': 'DBMShw',
    'password': '123456',
    'database': 'dbmshw'
}


# def querys(sql, params=[], type='no_select'):
#     params = tuple(params)
#     sql = sql % params
#     cursor.execute(sql)
#     if type != 'no_select':
#         data_list = cursor.fetchall()
#         conn.commit()
#         return data_list
#     else:
#         conn.commit()
#         return '数据库语句执行成功'


class DatabaseManager:
    """
    insert(table, data): 向指定表插入数据。
    select(table, where=None): 从指定表查询数据，可选的where参数用于添加WHERE子句。
    update(table, data, where): 更新指定表的数据，where参数用于指定更新的记录。
    delete(table, where): 从指定表删除数据，where参数用于添加WHERE子句。
    execute_query(query, params=None): 执行一个SQL查询，params用于查询参数。
    fetch_query(query, params=None): 执行一个SQL查询并返回结果，params用于查询参数。
    close(): 关闭数据库连接和游标。
    """

    def __init__(self):
        self.connection = connect(**db_config)
        self.cursor = self.connection.cursor(pymysql.cursors.DictCursor)

    def insert(self, table, data):
        keys = ', '.join(data.keys())
        values = ', '.join(['%s'] * len(data))
        sql_query = f"INSERT INTO {table} ({keys}) VALUES ({values})"
        self.cursor.execute(sql_query, tuple(data.values()))
        self.connection.commit()

    def select(self, table, where=None):
        sql_query = f"SELECT * FROM {table}"
        if where:
            sql_query += f" WHERE {where}"
        self.cursor.execute(sql_query)
        return self.cursor.fetchall()

    def update(self, table, data, where):
        set_values = ', '.join([f"{key} = %s" for key in data.keys()])
        sql_query = f"UPDATE {table} SET {set_values} WHERE {where}"
        self.cursor.execute(sql_query, tuple(data.values()))
        self.connection.commit()

    def delete(self, table, where):
        sql_query = f"DELETE FROM {table} WHERE {where}"
        self.cursor.execute(sql_query)
        self.connection.commit()

    def execute_query(self, query, params=None):
        self.cursor.execute(query, params)
        self.connection.commit()

    def fetch_query(self, query, params=None):
        self.cursor.execute(query, params)
        return self.cursor.fetchall()

    def close(self):
        self.cursor.close()
        self.connection.close()


if __name__ == "__main__":
    mydbms = DatabaseManager()
    create_table_query = """
    CREATE TABLE users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100),
        email VARCHAR(100) UNIQUE
    )
    """
    # Execute the query
    try:
        mydbms.execute_query(create_table_query)
        print("Table 'users' created successfully!")
    except pymysql.MySQLError as e:
        print(f"Error: {str(e)}")

    # Close the database connection
    mydbms.close()
