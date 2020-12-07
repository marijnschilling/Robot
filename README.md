# 🤖 Robot

### Software requirements
- \>= iOS 13.2
- \>=  XCode 11.3.1  
- Runs on any iPhone

### Manual
With this app you can control a robot. The robot is located on a two-dimensional grid. The robot moves around on the grid by parsing a string of commands:

• L: Turn left

• R: Turn right

• F: Walk forward

Example string: `LFFRFRFRFF`

When the robot runs out of commands, it shall report what square (x,y) it’s located at, and what direction it’s facing. When the app starts, you can specify the size of the grid, the position where the robot is located and which direction it is facing and the string of instructions.
Select "Go" to perform the Robot movements and see the final position of the Robot in an alert.

### Architecture
I decided to work with MVVM. I use the InputViewModel to transfer the input from the VC either a valid RobotViewModel or an error that can be displayed in the VC. The RobotViewModel we use initialise the RobotViewModel which translates the robot input values to the output string where the Robot ends up. In this case this is only displayed on a small alert view, but this setup enables the app to use a separate VC for this.

### Unit tests
I created Unit tests for the InputViewModel where the validation of the data is tested. In the Tests for the RobotViewModel I test moving and turning the Robot, and the two test cases given in the assignment.

### My Areas of attention
- I wanted to make sure that the input was correctly validated and that the user would be presented with a meaningful error message.
- I made the interface flexible so the UI work well on all different iOS devices and it works with scalable text sizes. Try it out by going to Settings > Accessibility > Display & Text Sizes > Larger Text. There you can turn on larger text sizes and slide to the preferred Text Size.
- I tried out a TDD approach for this assignment, since the requirements where very clear. It was a productive way of working, although I did need to rewrite my tests a bit a couple of times because the in and output required by the UI were different then I assumed in my tests.


### Improvements
- I would like to improve the design of the InputViewController, right now it's very basic. I could look into making paginated scrollview for each input section where we validate the input in each step.
- It would be nice when the next textfield automatically get’s selected after you filled in a value of one character for the grid size and robot position input fields, to improve the user flow.
- Even though it's not part of the assignment, it would be nice to make the movements of the Robot visible. When the input is validated I could show a ViewController with the grid on it where you can see how the robot is moving and where it ends up. I could even remove requiring the input of the instructions and have the user control the movements of the robot from this grid view.
