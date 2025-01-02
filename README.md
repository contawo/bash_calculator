# **Bash Simple Calculator**

A terminal-based calculator built with Bash scripting that allows you to perform basic arithmetic operations like addition, subtraction, multiplication, and division. This calculator also supports handling decimal precision, provides helpful messages, and allows users to interact with the script using simple command-line flags.

## **Table of Contents**

1. [Features](#features)
2. [Installation](#installation)
3. [Usage](#usage)
   1. [Command-Line Options](#command-line-options)
4. [Operations](#operations)
5. [Error Handling](#error-handling)
6. [Customizations](#customizations)
7. [Contributing](#contributing)
8. [License](#license)

## **Features**

- Perform basic arithmetic operations: addition, subtraction, multiplication, and division.
- Set the number of decimal places for calculations.
- Interactive, user-friendly prompts with color-coded messages.
- Option to disable the welcome message.

## **Installation**

This calculator works on **WSL (Windows Subsystem for Linux)**, **Linux**, and **Mac**. Follow the instructions below to install the application on your machine.

### 1. **Install WSL (for Windows users only)**

If you're using Windows and want to install WSL (Windows Subsystem for Linux), follow these steps:
- **WSL Installation Guide**: [How to install WSL](https://docs.microsoft.com/en-us/windows/wsl/install)

### 2. **Clone the Repository** (Optional)

If you're using this code from a Git repository, clone it to your local machine:

```bash
git clone https://github.com/yourusername/bash-calculator.git
cd bash-calculator
```

### 3. **Locate the `/usr/bin` Directory**

The calculator needs to be installed in a directory that is included in your system's `PATH`, such as `/usr/bin` or `/usr/local/bin`.

#### Find the correct `bin` path:

- On **Linux** and **Mac**, you can check the location by running the following command:
  ```bash
  echo $PATH
  ```
  Look for a path like `/usr/bin` or `/usr/local/bin`.

- On **WSL**, the process is the same. You can use `echo $PATH` to check for the correct directory.

### 4. **Give Execute Permissions to the Install Script and Main Script**

Before running the installation script, you need to give execute permissions to both the `install.sh` and `main.sh` files.

Run the following commands:

```bash
chmod +x install.sh
chmod +x main.sh
```

### 5. **Run the Installation Script**

Once the necessary permissions are granted, you can proceed with the installation by running the `install.sh` script.

```bash
./install.sh
```

This will move the `main.sh` file to a location in your system's `PATH` (e.g., `/usr/local/bin/` or `/usr/bin/`), making the calculator accessible from anywhere on your system.

### 6. **Verify Installation**

After running the installation script, verify that the calculator works by typing the following command:

```bash
calc
```

If everything is installed correctly, the calculator should start and prompt you for input.

## **Usage**

The calculator prompts you for inputs, performs operations based on your choices, and displays the result.

### Example Usage

Run the calculator using the command:

```bash
calc
```

The calculator will ask for numbers and operators interactively. For example:

```
> 2
~ +
> 3
~ =
Answer: 5.00
Logging: 2 + 3 = 5
```

### Command-Line Options

You can use flags when running the script to customize its behavior.

- `-d`: Disable the welcome message.
- `-s [number]`: Set the number of decimal places for the results.

#### Example:

```bash
calc -s 3
```

This command will set the result to have 3 decimal places.

#### Explanation of Options:

- **`-d`**: By default, the script displays a welcome message with rules, options, and author information. Use the `-d` flag to disable it:
  ```bash
  calc -d
  ```

- **`-s [number]`**: This option allows you to set the number of decimal places for calculations. For example, `-s 2` will ensure that all results are shown with two decimal places:
  ```bash
  calc -s 2
  ```

## **Operations**

The calculator supports the following basic arithmetic operations:

- **Addition** (`+`)
- **Subtraction** (`-`)
- **Multiplication** (`x`)
- **Division** (`/`)
- **Equal** (`=`): To display the result.

### Example Operations:

1. **Addition**:  
   ```
   > 2
   ~ +
   > 3
   ~ =
   Answer: 5.00
   Logging: 2 + 3 = 5
   ```

2. **Subtraction**:  
   ```
   > 10
   ~ -
   > 4
   ~ =
   Answer: 6.00
   Logging: 10 - 4 = 6
   ```

3. **Multiplication**:  
   ```
   > 4
   ~ x
   > 3
   ~ =
   Answer: 12.00
   Logging: 4 x 3 = 12
   ```

4. **Division**:  
   ```
   > 6
   ~ /
   > 2
   ~ =
   Answer: 3.00
   Logging: 6 / 2 = 3
   ```

## **Error Handling**

The calculator includes error handling to manage unexpected input. Here are some common errors:

- **Division by Zero**: If you attempt to divide by zero, the calculator will display an error message and prompt you to try again.
  ```
  > 5
  ~ /
  > 0
  Error: Division by zero not allowed. Please try again.
  ```

- **Invalid Operator**: If you enter an invalid operator, the calculator will prompt you again.
  ```
  > 5
  ~ ^
  Error: Expected an operator (+, -, x, /, =) but got [^]. Please try again.
  ```

- **Invalid Number**: If you enter something other than a number, the script will ask you to enter a valid number.
  ```
  > 2
  ~ +
  > abc
  Error: Expected a number but got [abc]. Please try again.
  ```

## **Customizations**

You can modify the script to suit your needs:

- **Decimal Precision**: The default decimal precision is set to two decimal places. You can change this by using the `-s [number]` option or editing the `decimal_scale` variable in the script.
  
- **Appearance**: The script uses color codes for better readability. You can modify the colors by editing the `red_color`, `green_color`, `cyan_color`, and `yellow_color` functions.

- **Custom Links**: The calculator includes clickable links to the author and for logging complaints. Modify these links in the `welcome_message` function.

## **Contributing**

Feel free to contribute to this project by forking the repository, making improvements, or submitting bug fixes.

### Steps to Contribute:
1. Fork this repository.
2. Create a branch with your changes (`git checkout -b feature-name`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-name`).
5. Open a pull request for review.

## **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
