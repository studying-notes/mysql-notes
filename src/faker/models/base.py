from peewee import Model, DatabaseProxy

proxy = DatabaseProxy()


class BaseModel(Model):
    class Meta:
        database = proxy
