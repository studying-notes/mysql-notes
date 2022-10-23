from peewee import TextField, ForeignKeyField

from .base import BaseModel
from .post import Post
from .user import User


class Comment(BaseModel):
    content = TextField()
    user = ForeignKeyField(User, backref="comments")
    post = ForeignKeyField(Post, backref="comments")

    class Meta:
        table_name = "comments"
