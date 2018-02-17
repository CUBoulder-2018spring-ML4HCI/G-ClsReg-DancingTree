# G-ClsReg-DancingTree
Max Wenzel and Kushal Joshi's Classifier and Regression Group Project

## Goals
Our goal for this project was to create a program that would take in raw audio and produce an interesting and responsive visual output. We wanted it to be both visually stimulating and also transparent that the graphics were responding to the music.

## Tools Used
For this project we used the Various Audio Inputs to take in audio from the webcam mic. We also used the Wekinator Input helper to process the input from the audio inputs. We also then modified pre-existing Recursive Tree code from the processing.org examples and made it so color and angle were controlled by the audio input.
## ML Choices Made
For our classifier we chose the K-Nearest Neighbors algorithm with a k of 1. We found this to be very sufficient as we chose this as our first option and due to the distinctiveness of our features and with enough data it very clearly recognized the correct instrument. Due to the high dimensionality of the input other algorithms would likely not be sufficient.

For the regression we chose to use simple linear regression. When testing with even the most simple neural network, there was consistently no response in output and it would just rest at a constant value. I believe the limiting factor in this was our relatively small amount of training data. While the output is noisy from the linear regression, this is actually desired to give the tree a more organic feel.

## What we have accomplished

We have managed to create a working prototype so far. While the output is not as pleasant as we had hoped, it is quite amusing. Given the created song being played to the webcam microphone, the program does produce a video output showing an animated recursive tree that's angle is controlled by pitch and the background color is determined by the instrument.

## Challenges

It was quite challenging getting an audio input that had enough definition to identify features but also not too noisy. We overcame this by using the Wekinator Input helper so that input is only sent when the volume is over a certain amount. This eliminates almost all background noise from the input.

We also struggled on the output side of creating a dynamic output that seemed responsive. To overcome this problem we modified pre-existing example code that could be used to produce an interesting animation. We hope to continue to build an original more complex output.

## Demo Video

[Our Demo Video](https://youtu.be/KKFQsEep3C8)

## What we learned

From this project we learned a lot about how to work with and process raw audio input in such a way that useful features can be extracted from it. We also learned about modifying pre-existing code to meet our needs. We also learned quite a bit about how sometimes a simple solution produces more interesting results than a complex one.


