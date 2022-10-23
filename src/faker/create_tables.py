from db import mysql
from models import User, Post, Comment

mysql.connect()

Comment.drop_table()
Post.drop_table()
User.drop_table()

mysql.create_tables([User, Post, Comment])
