# Reading-and-Interpreting-Statistical-Charts using MATLB
Statistical charts are used to represent statistical data in visual form. One of the most used statistical charts is the Bar chart which presents categorical data with rectangular bars of heights proportional to the values that they represent. Pie charts are also used Sometimes to illustrate numerical proportions. In pie charts each proportion is represented by a slice from the circular shape.  Interpreting such charts visually may not produce an accurate results. And if there are a multiple number of charts then it will be exhaustive to interpret them one by one. In this application, you will interpret statistical charts and extract information from them programmatically. Given an image that contains a statistical chart and the color of each category (i.e. legend), your program should extract statistical information in a textual from. 

## Generate a report summarizing chart information from pictures with:
1.	A bar chart or  a pie chart
2.	Different legend positions
3.	Legend is surrounded by a black border
4.	Interpreting a bar chart with its max value appeared on a horizontal line on the y-axis

## Implementation
### 1- Bie Chart
1. read image
2. cropping the information/legend block and crop each color title to use them later
#####          NOTE: legend block is the larger block
4. count all blocks/legend in the whole image by canny edge detection
5. display each region and count the color pixels
6. sum all color pixel pecentage in each region
7. calculate the color region pecentage
8. assign each region color to number 2.

### 2- Bar Chart
1. read image
2. cropping the information/legend block and apply OCR on each one to get title for each bar to use them later
#####          NOTE: legend block is the larger block
4. count all blocks/legend in the whole image by canny edge detection
5. display each bar and apply an equation to calculate the bar height
6. assign each bar color to number 2.

## How to test functions
### 1- Bie Chart
1. open solve.m file
2. change the image path (you have 9 test files contains test images)
### 2- Bar Chart
1. open bar.m file
2. change the image path (you have 9 test files contains test images)
