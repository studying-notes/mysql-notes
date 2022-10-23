from peewee import CharField, BooleanField

from .base import BaseModel


class User(BaseModel):
    username = CharField()
    password = CharField()
    email = CharField()
    is_active = BooleanField(default=True)
    is_admin = BooleanField(default=False)

    class Meta:
        table_name = "users"
