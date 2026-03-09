# TapeQuest

## Description:
Players control a character navigating a fixed arena, surviving escalating waves of AI enemies. The game is the foundational prototype for a larger RPG featuring tape-based crafting, gacha character collection, and open-world combat.

Ran via Processing.

## Year 2 concepts:

Collections — ArrayList<Enemy>

Enhanced for loop — for (Enemy e : enemies)

Exception handling — try/catch in ScoreManager

File I/O — BufferedReader / PrintWriter in ScoreManager

Multiple classes with logical responsibilities

Inheritance — Player extends Entity, Enemy extends Entity

# What is inherited from Entity:

## x, y — position on screen

## radius — size of the circle

## bx, by, bw, bh — the map boundary values used for clamping

Abstract class — Entity

Interface — Drawable

## Class Diagram (NOT UPDATED):

![Gameplay Screenshot](./Image/Classdiagram.png)

## Gameplay:

![Gameplay Screenshot](./Image/Gameplay.png)

## Start Screen:

![Gameplay Screenshot](./Image/Startscreen.png)

## Crafting UI

![Gameplay Screenshot](./Image/Craftui.png)
