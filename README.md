# TaskManager

A command-line task management application built with Swift.

## Features

- Create, Read, Update, and Delete tasks
- Simple command-line interface
- Task completion tracking
- Due date management
- Task listing with detailed information

## Requirements

- Swift 5.5+
- Replit account (for online development)
- Or local Swift development environment

## Setup

1. Clone the repository
2. Open the project in Replit or your local Swift environment
3. Run the program using `swift run`

## How to Use

The application provides a simple menu-driven interface:

1. **Add a new task**
   - Enter task title
   - Enter task description
   - Enter due date (MM/dd/yyyy HH:mm format)

2. **List all tasks**
   - View all tasks with their details
   - See completion status
   - View due dates

3. **Complete a task**
   - Enter the task number to mark as completed

4. **Delete a task**
   - Enter the task number to delete

5. **Exit**
   - Close the application

## Example Usage

```
Welcome to Task Manager!

Please choose an option:
1. Add a new task
2. List all tasks
3. Complete a task
4. Delete a task
5. Exit

> 1
Enter task title: Complete Project
Enter task description: Finish the Swift project
Enter due date (MM/dd/yyyy HH:mm): 05/25/2024 14:30
Task added successfully!
```

## Project Structure

```
.
├── main.swift          # Main program file
├── Package.swift       # Swift package configuration
└── README.md          # This file
```

## Development

This is a command-line application built with Swift. The main components are:

- `Task` struct: Defines the task data structure
- `TaskManager` class: Handles task operations
- `main()` function: Provides the user interface

## Future Improvements

- Add data persistence
- Implement task categories
- Add task priorities
- Support for task editing
- Add due date reminders

## License

MIT License 

