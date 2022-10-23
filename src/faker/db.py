import logging

from peewee import MySQLDatabase

from models import base

logger = logging.getLogger("peewee")
logger.addHandler(logging.StreamHandler())
logger.setLevel(logging.DEBUG)

mysql = MySQLDatabase(
    "base",
    user="root",
    password="password",
    host="localhost",
    port=3306,
)

base.proxy.initialize(mysql)
