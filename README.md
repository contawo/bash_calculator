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

If you're using Windows and want to install WSL (Windows Subsystem for Linux), follow this guide:  
- [How to install WSL](https://docs.microsoft.com/en-us/windows/wsl/install)

### 2. **Clone the Repository**

If you're using this code from a Git repository, clone it to your local machine:

```bash
git clone https://github.com/contawo/bash_calculator.git
```

Navigate into the cloned repository:

```bash
cd bash_calculator
```

### 3. **Give Execute Permissions**

Ensure the required files are executable before installation:

```bash
chmod 777 install.sh
```

```bash
chmod 777 main.sh
```

### 4. **Install Dependencies**

Before running the installation script or using the calculator, ensure the necessary dependencies are installed. The scripts require the following tools:  

1. **`bc`**: A command-line calculator for mathematical operations.
2. **`fzf`**: A fuzzy finder used for selecting the installation path interactively.  

To install these dependencies, use the following commands:  

For **Ubuntu/Debian-based systems**:  
```bash
sudo apt update
sudo apt install bc fzf
```  

For **Fedora-based systems**:  
```bash
sudo dnf install bc fzf
```  

For **MacOS (with Homebrew)**:  
```bash
brew install bc fzf
```  

For other systems, refer to your package manager's documentation to install these tools.  

### 5. **Run the Installation Script**

1. **Identify your system's `PATH` directories**:  
   Use the following command to see the directories in your system's `PATH`:  
   ```bash
   echo $PATH
   ```  
   This will output a list of directories separated by colons (`:`), such as:  
   ```
   /usr/bin:/usr/local/bin:/some/other/path
   ```  

2. **Select the correct directory**:  
   Look for a directory like `/usr/bin` or `/usr/local/bin`. In this documentation, we will use `/usr/bin` as an example. If your desired directory is different, replace `/usr/bin` with the appropriate path throughout the instructions.

3. **Run the installation script**:  
   Execute the installation script to move the calculator to the correct directory in your system's `PATH`:  
   ```bash
   ./install.sh
   ```  

4. **Handle insufficient permissions**:  
   If you encounter an error like `Insufficient permissions to write to /usr/bin`, proceed to the **Manual Installation** steps instead.

### 6. **Manual Installation**

If the installation script cannot be run (e.g., due to insufficient permissions), follow these steps to manually install the calculator:

1. **Give Execute Permissions to the Main Script**  
   Make the `main.sh` file executable so it can be run as a script.

   ```bash
   chmod 777 ./main.sh
   ```

2. **Create a Copy of the Script**  
   To preserve the original script, copy it and rename the copy as `calc`:

   ```bash
   cp -p -v ./main.sh ./install_main.sh
   ```

   ```bash
   mv -v ./install_main.sh calc
   ```

3. **Move the Script to a System Path Directory**  
   Move the renamed script (`calc`) to a directory included in your system's `PATH`. Common locations are `/usr/bin` or `/usr/local/bin`.  

   ```bash
   sudo mv calc /usr/bin/
   ```

4. **Ensure the Script is Executable**  
   Double-check that the `calc` script has execute permissions:

   ```bash
   sudo chmod 777 /usr/bin/calc
   ```

5. **Alternative execution**

    If the step `sudo mv calc /usr/bin/` fails due to insufficient permissions or other issues, you can still use the calculator by running the script directly:

    ```bash
    ./main.sh
    ```
    In this case, you must use the full path to main.sh every time you want to run the calculator. For easier access, consider creating an alias in your shell configuration file (`~/.bashrc`, `~/.zshrc`, etc.):

    ```bash
    alias calc='/path/to/main.sh'
    ```
    Replace `/path/to/main.sh` with the actual path to the main.sh file. Then reload your shell configuration:

    ```bash
    source ~/.bashrc  # or ~/.zshrc, depending on your shell
    ```

### 7. **Verify Installation**

After installation, verify the calculator works by running:

```bash
calc
```

## **Usage**

The calculator prompts for inputs, performs operations based on your choices, and displays results.  

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

You can use flags to customize behavior:

- `-d`: Disable the welcome message.  
- `-s [number]`: Set the number of decimal places for results.

Example:
```bash
calc -s 3
```

This command sets results to 3 decimal places.

## **Operations**

Supported operations include:

- **Addition (`+`)**  
- **Subtraction (`-`)**  
- **Multiplication (`x`)**  
- **Division (`/`)**  

### Example Operations

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

The calculator manages errors such as:

- **Division by Zero**:
  ```
  > 5
  ~ /
  > 0
  Error: Division by zero not allowed. Please try again.
  ```

- **Invalid Operator**:
  ```
  > 5
  ~ ^
  Error: Expected an operator (+, -, x, /, =) but got [^]. Please try again.
  ```

- **Invalid Number**:
  ```
  > abc
  Error: Expected a number but got [abc]. Please try again.
  ```

## **Customizations**

Customize the script to fit your needs:

- **Decimal Precision**: Use the `-s` option or edit the `decimal_scale` variable in the script.  
- **Appearance**: Modify colors in the `welcome_message` and error functions.  

## **Contributing**

### Steps to Contribute

1. **Fork the Repository**:
   - Fork this repository to your account.  

2. **Create a Branch**:
   ```bash
   git checkout -b feature-name
   ```

3. **Run the Application**:
   - **Production Mode**:
     ```bash
     npm start
     ```
   - **Development Mode**:
     ```bash
     npm run dev
     ```

4. **Commit Your Changes**:
   ```bash
   git commit -m 'feat: add functionality'
   ```

5. **Push Your Changes**:
   ```bash
   git push origin feature-name
   ```

6. **Create a Pull Request**:
   - Submit a pull request for review.

## **License**

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.