# pimpMyQueue

####pimpMyQueue is a machine designed to keep track of a virtual bank queue.

## Brief Explanation

The SBqM module has has 4 inputs, backSensor, frontSensor, reset and tCount.
It has 3 outputs, pCount, emptyFlag and fullFlag.
This module counts the number of persons or clients in a bank queue and sends it to the outputs.


### backSensor and frontSensor

The backSensor is a virtual sensor at the end of the queue. normally it produces logic 1 unless interrupted then it produces logic 0.
If the module senses a logic 0 from the backSensor, it increments pCount (number of persons) by 1.
The frontSensor is the exact opposite, it decrements pCount by 1.

The module has 2 internal registers corresponding to both sensors, they get the values of both sensors on the rising edge of the clock.
This is to minimize the error in the counting process. if the sensors are pulsing faster than the clock then we have a hardware problem.

### reset

resets the pCount to zero while blanking the fullFlag and putting the emptyFlag on high.
reset is active high.

### pCount

This is the number of persons in the queue at a given time. it's incremented by the backSensor and decremented by the frontSensor.
It's three-bits wide.

## tCount

The number of tellers at our bank, this is used in calculating the wTime (wait time).

## wTime

wTime is give by the formula:

#### *wTime = 3\*(pCount + tCount - 1) / tCount*

We're using a lookup table to calculate wTime though.

## fullFlag and emptyFlag

fullFlag is logic one when the pCount is 7 and zero otherwise.
emptyFlag is logic one when the pCount is 0 and zero otherwise.

## emptyOverFlow and fullOverFlow

Impossible flags and kinda useless for this model.

## lut Module

To be fair, some of the ideas of this lookup table were snatched off the internet.
I guess you could call it "doing my research".

lut short for lookup table is a rom that has all possible values for wTime.
The values are saved in *parameters.v*.
This module concatenates the value of tCount and pCount to provide the aligning value of wTime.
The formula it uses for the index is {(tCount-1), pCount}

Say tCount = 2 and pCount = 5
Then index = 01 101
Which is decimal 13.
Therefore it calls on memory location 13.

# Simulation

First, we tried overflowing the pCount.

Here's the pCount stopping at 7.

![alt_text](https://github.com/OsamaAdam98/pimpMyQueue/blob/master/positiveOverFlowCondition.PNG)

Then, we tried hammering frontSensor to try to see if the pCount will get to a negative value.

Nope, we did this right.

![alt_text](https://github.com/OsamaAdam98/pimpMyQueue/blob/master/negativeOverFlowCondition.PNG)

Finally, here's a condition verifying that the fullFlag and emptyFlags are functioning properly.

![alt_text](https://github.com/OsamaAdam98/pimpMyQueue/blob/master/flagsFunctioningProperly.PNG)

Project could be updated at a later time.

