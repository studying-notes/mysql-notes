from faker import Faker

from db import mysql
from models import Post

fake = Faker()

mysql.connect()

Post.drop_table()
mysql.create_tables([Post])

# insert 1 post
post = Post(
    title=fake.sentence(),
    content=fake.text(),
    user_id=fake.random_int(min=1, max=1000000),
)

post.save()
