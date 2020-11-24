import pygame, math

#colors
black = (0, 0, 0)

size = (1920, 1080)
screen = pygame.display.set_mode(size)

r = 200

clock = pygame.time.Clock()
FPS = 120
i = 0
while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            quit()
    clock.tick(FPS)
    angle = i * 3.14 / 180
    a = r * math.cos(angle) + 960
    b = r * math.sin(angle) + 540
    screen.fill(black)
    print(a)
    print(b)
    pygame.draw.circle(screen, (50, 200, 50), (int(a), int(b)), 70)
    pygame.display.update()
    i += 1
    if i > 360:
        i = 0
