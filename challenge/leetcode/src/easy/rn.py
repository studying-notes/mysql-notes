from glob import glob
from os import rename

for item in glob('*.sql'):
    rename(item, item.replace('gorm_test', 'leetcode_easy'))
