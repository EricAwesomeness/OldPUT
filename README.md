# OldPUT
This PowerShell script, labeled as version 6.13.0, serves as a utility toolkit for handling common Active Directory (AD) tasks. It's designed to assist service technicians in managing user accounts efficiently. Here's a breakdown of its main features and functionality:

- **GUI Interface**: The script utilizes a graphical user interface (GUI) built with Windows Forms to provide an interactive experience for the user.

- **Functionality**:
  - **Account Check**: Allows users to verify user account details such as name, employee number, last password change date, and account status (enabled/disabled).
  - **Account Unlock**: Unlocks user accounts across multiple domain controllers if they are locked out.
  - **Set Password Of Day**: Sets the password of a specified user to the password of the day on multiple domain controllers.*
  - **Set Password To Expired**: Marks the password of a specified user as expired.
  - **PC Lookup**: Allows users to search for computers by entering part or all of the computer name.
  - **Search For Computers**: Searches for registered devices in the TAHR location based on the entered computer name.
  - **Work History**: Displays a history of actions performed using the toolkit.
  - **Help Menu**: Provides information and instructions for using various functions within the toolkit.
  - **Auto-Completion**: Utilizes an AutoCompleteStringCollection to provide auto-completion functionality for user input based on existing AD user names and payroll numbers.
  - **Job Parallelization**: Utilizes PowerShell's job parallelization features to unlock user accounts across multiple domain controllers simultaneously, improving efficiency.

*(This is due to replication being broken in this environment causing it to take up to 20 minutes sometimes. I have the rights as a tech to create a script but not to fix the domain replication.) 
