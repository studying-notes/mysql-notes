from faker import Faker
from models import User
from bulk import bulk_create

fake = Faker()


def user_generator():
    return User(
        username=fake.user_name(),
        email=fake.email(),
        password=fake.password(),
    )


if __name__ == "__main__":
    bulk_create(user_generator, User, loop=1000)
