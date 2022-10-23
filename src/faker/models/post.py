from peewee import CharField, TextField, ForeignKeyField

from .base import BaseModel
from .user import User


class Post(BaseModel):
    title = CharField()
    content = TextField()
    user = ForeignKeyField(User, backref="posts")

    class Meta:
        table_name = "posts"
