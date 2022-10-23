from faker import Faker

from bulk import bulk_create
from models import Post

fake = Faker()


def post_generator():
    return Post(
        title=fake.sentence(),
        content=fake.text(),
        user_id=fake.random_int(min=1, max=1000000),
    )


if __name__ == "__main__":
    bulk_create(post_generator, Post, loop=10000)
