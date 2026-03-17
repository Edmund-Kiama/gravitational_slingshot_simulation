# 🪐 Gravitational Slingshot Effect Simulator

A physics-based simulation built with Python and Pygame that models the gravitational slingshot (or gravity assist) effect — the same orbital mechanics technique used by space agencies to accelerate spacecraft using a planet's gravitational field.

---

## 📌 Problem Statement

When a spacecraft passes close to a massive planet, the planet's gravity bends its trajectory and can either accelerate or decelerate it — depending on the approach angle. This phenomenon, known as the **gravitational slingshot** or **gravity assist**, is a critical technique in real-world space exploration (used in missions like Voyager, Cassini, and New Horizons).

The challenge this project addresses is: **how do we visually and interactively simulate the effect of gravitational attraction on a moving body in 2D space?**

This simulation allows a user to:
- Launch asteroids from any position on screen
- Observe how the planet's gravity bends, accelerates, or traps the asteroid's path
- Experiment with different launch angles and velocities to achieve orbital or slingshot trajectories

---

## 🔬 Physics & Research

The simulation is grounded in **Newtonian gravitational mechanics**:

### Gravitational Force
```
F = G * m1 * m2 / r²
```

Where:
- `G` — Gravitational constant (set to `5` for simulation scale)
- `m1`, `m2` — Masses of the planet and asteroid
- `r` — Distance between the two bodies

### Acceleration
```
a = F / m
```

The acceleration is decomposed into x and y components using the angle `θ` between the asteroid and the planet:

```
aₓ = a * cos(θ)
aᵧ = a * sin(θ)
```

Each frame, the acceleration updates the asteroid's velocity, and the velocity updates its position — a simplified **Euler integration** of the equations of motion.

---

## 🖥️ Prerequisites

Ensure you have the following installed before running the simulation:

- **Python 3.7+** — [Download here](https://www.python.org/downloads/)
- **Pygame** — Install via pip:

```bash
pip install pygame
```

### Required Asset Files

Place the following image files in the **same directory** as the script:

| File | Description |
|------|-------------|
| `background.jpg` | Space/starfield background image |
| `earth.png` | Planet sprite (rendered at 100×100 px) |
| `asteroid.png` | Asteroid sprite (rendered at ~17×17 px) |

> **Note:** The images must exist in the working directory or the program will crash on launch. Any appropriately sized PNG/JPG images can be used.

---

## 🚀 How to Run

1. Clone or download the project files into a single folder.
2. Add the required image assets (`background.jpg`, `earth.png`, `asteroid.png`) to the same folder.
3. Run the script:

```bash
python gravitational_slingshot.py
```

---

## 🎮 How to Use

| Action | Description |
|--------|-------------|
| **First click** | Sets the starting position of the asteroid |
| **Move mouse** | A line preview shows the launch direction and velocity |
| **Second click** | Launches the asteroid toward the initial click point with velocity scaled to mouse distance |
| **Close window** | Exits the simulation |

The further your mouse is from the starting point when you click, the faster the asteroid will be launched.

---

## ✨ Features

- **Real-time gravitational physics** — Asteroids are deflected, orbited, or slung around the planet each frame
- **Interactive launch system** — Click-drag interface lets you aim and control asteroid velocity
- **Visual trajectory preview** — A white line is drawn from the launch point to your current mouse position before firing
- **Collision detection** — Asteroids that hit the planet are removed from the simulation
- **Off-screen cleanup** — Asteroids that leave the window bounds are automatically removed
- **Multi-asteroid support** — Fire multiple asteroids simultaneously and watch them interact with gravity independently
- **Sprite-based rendering** — Custom images for the planet, asteroid, and background

---

## ⚙️ Configuration

Key simulation parameters are defined at the top of the file and can be tuned:

| Constant | Default | Description |
|----------|---------|-------------|
| `WIDTH`, `HEIGHT` | `800, 600` | Window dimensions in pixels |
| `PLANET_MASS` | `100` | Mass of the central planet |
| `ASTEROID_MASS` | `5` | Mass of each launched asteroid |
| `G` | `5` | Gravitational constant (scaled for simulation) |
| `FPS` | `60` | Frames per second |
| `PLANET_RADIUS` | `50` | Planet's collision/visual radius |
| `VEL_SCALE` | `100` | Divides mouse distance to determine launch speed |

---

## 🧱 Project Structure

```
gravitational-slingshot/
├── gravitational_slingshot.py   # Main simulation script
├── background.jpg               # Background image asset
├── earth.png                    # Planet image asset
├── asteroid.png                 # Asteroid image asset
└── README.md
```

---

## 🔭 Assumptions

- The planet is **stationary** at the center of the screen — it does not move regardless of forces applied.
- Gravity is **2D only** — there is no z-axis or out-of-plane component.
- The simulation uses **Euler integration** (simple per-frame velocity updates), which is a first-order approximation and may accumulate errors over long trajectories.
- Asteroids are treated as **point masses** for force calculations, though they are rendered with a sprite image.
- **No asteroid-to-asteroid gravity** — only planet-to-asteroid gravitational interaction is modeled.
- The gravitational constant `G = 5` is a **scaled simulation value**, not the real-world `6.674 × 10⁻¹¹ N·m²/kg²`.

---

## 🛠️ Known Limitations & Future Improvements

- [ ] Add trajectory trail/path rendering to visualize the full orbit history
- [ ] Support multiple planets with independent gravitational fields
- [ ] Implement a more accurate integrator (e.g., Verlet or Runge-Kutta) for smoother long-term orbits
- [ ] Add a velocity/angle HUD display on launch preview
- [ ] Include orbital speed indicator and escape velocity threshold
- [ ] Add sound effects on launch and collision

---

## 📚 References

- [Gravity Assist — NASA](https://science.nasa.gov/learn/basics-of-space-flight/chapter4-2/)
- [Newton's Law of Universal Gravitation — Wikipedia](https://en.wikipedia.org/wiki/Newton%27s_law_of_universal_gravitation)
- [Pygame Documentation](https://www.pygame.org/docs/)