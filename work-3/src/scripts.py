import os 

urls = [
    'https://docs.github.com/en',
    'https://www.jetbrains.com/ru-ru/pycharm/',
    'https://developer.mozilla.org/en-US/docs/Web/CSS/@import',
    'https://stackoverflow.com/questions/455612/limiting-floats-to-two-decimal-points',
    'https://www.desmos.com/calculator?lang=ru',
    'https://ru.wikipedia.org/wiki/CURL',
    'https://genius.com/Fendiglock-chance-lyrics',
    'https://www.travisscott.com/',
    'https://typst.app/',
    'https://www.instagram.com/'
]

commands = [
    'curl --version',
    ''
]

l = []

for i in range(1, 11):
    l.append(f"silicon -o img/req_{i}.png -l sh --no-window-controls commands/2/req_{i}.txt")

print(' && '.join(l))
