import time
from typing import Type

from db import mysql
from models.base import BaseModel

mysql.connect()


"""
100 x 1000 15.96s
10 x 10000 14.34s
1 x 100000 15.28s
"""


def bulk_create(
    generator,
    model: Type[BaseModel],
    batch_size: int = 10000,
    loop: int = 100,
):
    """
    Bulk create objects in the database.

    :param generator: The generator function that yields objects.
    :param model: The model class.
    :param batch_size: The number of objects to create in a batch.
    :param loop: The number of times to loop the generator.
    """
    begin = time.time()

    for _ in range(loop):
        model.bulk_create([generator() for _ in range(batch_size)])

    end = time.time()

    print(f"Time taken: {end - begin:.2f} seconds")
