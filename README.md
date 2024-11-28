# Quiz Game
A Quiz Game built with SwiftUI that dynamically generates unique quiz questions using OpenAI's ChatGPT API. This project combines modern SwiftUI design principles with the flexibility of AI-generated content.

## Features
- Dynamic Question Generation: Leverages the ChatGPT API to create unique questions, ensuring a fresh experience every time.
- Dark Mode Support: Provides a seamless UI experience in both light and dark modes.
- Custom Games: Allows users to create a game with their preferred number of questions and choose the desired GPT model.
  
## Installation
The app has no external dependencies and can be built and run directly.
To enable question generation, you must set the OPEN_AI_API_KEY environment variable with your OpenAI API key.

![image](https://github.com/user-attachments/assets/8938946d-a183-4f95-8e62-5fb178bd5f06)

## Architecture
The app is built using the MVVM (Model-View-ViewModel) architectural pattern.

## Future Enhancements
This project is a work in progress, and the following features are planned for future updates:

- View previous games (WIP).
- New game modes, including:
  - Timed quiz.
  - Study mode.
- Level progression, leaderboards, badges, and achievements.
- Multiplayer mode.
- Localization support.
