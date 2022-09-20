% MATLAB CRASH COURSE - Zero to Hero
% youtube.com/c/PhilsBeginnerCode
% Link to the Livestream: https://www.youtube.com/watch?v=UrYOiJwL47g
% 2hr video covering same topics: https://www.youtube.com/watch?v=EtUCgn3T9eE&t=45s

%%%%% TOPICS COVERED
% 1. Using the Command Window
% 2. Tour of Integrated Development Environment (IDE)
% 3. Variables & Datatypes
% 4. Basic Arithmatic
% 5. Linear Algebra Review w/ Matrices & Arrays
% 5.1 Function Anatomy with Matrices
% 5.2 MATLAB Installation & Toolboxes, range()
% 6. Indexing
% 7. EXAMPLE - max and min of f(x), plug in f(-10)
% 8. Anonymous Functions
% 9. Getting Help
% 10. Plotting Basics
% 11. Types of Plots
% 12. Programming Best Practices (naming conventions, learning)
% 13. Logic and Conditional Statements
% 14. If Statements
% 15. Switch Statements
% 16. For Loops
% 17. While Loops
% 18. User-defined Functions
% 19. File Structure w/ Functions
% 20. Pro/Con of MATLAB in the Coding World
%%%%%%%%%%%%% ADVANCED %%%%%%%%%%%%%%
% 21. Structures
% 22. Debugger
% 23. Scope (local vs. global)
% Probability and Random Numbers 
% Curve Fitting w/ Polyfit Polyval
% Image Processing
% Integrals & Derivatives
% Animate a Moving Cosine curve (make .mp4)
% EXAMPLE - Tank Game
% EXAMPLE - Scatter Plots
% EXAMPLE - Probability Game
 
%% DataTypes
% Datatypes are the various kinds of data you will encounter
% it's how the computer 'sees' information
% double --> stores number like 1.2 and -800
% string --> stores words like "Happy" and "Day"
% character --> stores individual characters like 't' and 'w'
% boolean --> stores true/false as 1 and 0

clc, clearvars, close all

x=7; % double
name = "emily and jake"; % string
bunchletters = 'tslu'; % character
isitWinter = 0; % boolean (0 = false, 1 = true) 

%% Basic Algebra
% force order of operations with ()
% pretty straightforward with + - / * ^ sqrt(), exp(), pi, etc.
clc, clearvars


equ = 2 + 9^2 - 8^(1/2);
equ2 = 2 + 9^2 - sqrt(8);

test = 8*exp(9); % 8e^9 (with decay constant)

%% Matrices and Arrays
clc, clearvars, format compact 

A = [98, 10, 20, 300]; %4*1
B = [3;4; 12; 100; 20];
C = [69, 420; 420 69];
D = [68, 419;
    421, 70];
E = linspace(20,25); % 100 evenly spaced values between 20 and 25
F= 78:100; % from 78 to 100 by 1 (default)
G= F';
H = D';
I=det(C); % determinant of a square matrix

%help linspace; get help by typing 'help linspace' in command window
J = linspace(69,420,10);
K = 1:2:10;
% Array = nx1 or 1xn
% Matrix = nxn


%% LINEAR ALGEBRA
clc, clearvars, clear all, format compact

A=rand(2,2);
%rand gives random numbers between 0 and 1, for a specified matrix size
C=2;
A+C; % vector + scalar
B=10*rand(2,2); % random nums between 0 and 10
A*B;
%order of multiplication matters for matrix multiplication

% Elementwise Operations (NOT linear algebra rules)
month = 1:12;
% the above defines a variable named month as an array that begins at 1, and adds 1 up
% to 12
sales = rand(1,12);
% defines sales as a random array of 12 values between 0 and 1
% month*sales would give an error, because matrix dimensions don't agree
month.*sales;
%by adding a dot, you can make it work by overriding order of operations

% let's say we want to solve values for y=x^2+4. first need to define some
% VALUES
x = linspace(-10,10);
y=x.^2+4;
% define a domain, and then use that to solve your given eq. use dots to do
% the element-wise approach before an operation
plot(x,y)

%% Indices
clc, clearvars, clear all, format compact

StringArray=["Thomas", "River","Dasan"]; %numbered from 1 logically in matlab

D=eye(7); %7x7 identity matrix (1s on diagonal, otherwise 0s)
D(3,3) %output: Third row, third column 

A = rand(7)*200; %7x7 matrix of numbers from 0 to 200
B=linspace(A(3,3), A(1,1));%100 even steps between two random numbers from the Matrix A

selection = randi(3,1); %1x1 array of random numbers from 1 to 3
Winner=StringArray(selection)


%% Plotting
clc, clearvars, close all % close all closes plot figures

figure(1)
x = linspace(-10,10,10);
y = 7*cos(8*x);
f = 1:10; 
g = f.^2; 
plot(x,y,'.-r'), hold on 
plot(f,g,'ms-.')
title("y vs. x")
xlabel("x-values")
ylabel("y-values")
grid on

figure(2)
plot([1:10],[11:20])
xlabel('basic x'),ylabel('basic y')

%% booleans
% the trues and falses of code
% true = 1, false = 0. MATLAB calls these LOGICALS
clc, clearvars, close all
 x = 20;
 y = 17; 
 z = 84;

 x > y % is X greater than Y
 x == y % is X equal to Y
 x ~= y % is X not equal to Y

 % and  is &
 % or is |
 x>y & z >y
 x>y | z >y
 x>y | z==y

%% If Else Statements
clc,clearvars,close all
x = 202; 
y = 202;
if (x > y) % first check if x is greater than x
    disp("X is larger than Y")
elseif(x < y) % then check if x is less than x
    disp("X is the smaller one")
else % the 'catch all' if the above if's are false
    disp("X equals to Y")
end

% Switch Statements
x = 101; 
switch(x) % check x equals to certain value 
    case(10) % equivalent to x == 10
        disp("x is greater than 10")
    otherwise % if no cases are met
        disp("not the situation")
end
% Editor can find a tool named as smart indent

%% For Loops
% When you want to repeat actions a specific number of times
clc, clearvars, clear all, format compact

% basic
for i=1:10 %iterate over i from 1 to ten
    disp(i) %iterative output: value of i
end

% little better
X=linspace(0,200);

for i=1:10 %iterate over i from 1 to ten
    disp(X(i)) %iterative output: value of the corresponding value in X
end

% best
for i=1:length(X) %iterate over i from 1 to the number of elements in X
    disp(X(i)) %iterative output: value of the corresponding value in X
end

% Nested if statement within a For Loop
Y=linspace(0,200,200);
for i=1:length(Y)
    value=Y(i); %take i-th value of Y
    
    if value > 5 %condition
        disp("yes, greater than!") %output if condition is met
    end
end

%% while loop 
% keep looping until a condition is FALSE
% no automatic indexing

x = 5; y = 10;
while (x < y) % the actions are performed if this is true
    disp("x less y")
    x = x + 1; % important for keeping the loop from running infinitely
    
    % String Manipulation
    out_string = strcat("x is ", string(x)); %can use num2str(x) instead of str(x)
    disp(out_string)

    out_string1 = strcat("y is ", string(y));
    disp(out_string1)
end % if the conditional statement is FALSE, break out of loop and continue on

%% string and character manipulation minipulation.
clc,clearvars, clear all, format compact
c1 = 'river'
c2 = ' was right'
s1 = "river"
s2 = " was right"

% Concatenate means 'to bring together'
combined_chars = strcat(c1, c2) % string concatenation (works with characters too)

combined_strings = s1 + s2
combined_strings2 = strcat(s1, s2)

combined_chars(1:3) % many chars to index through
combined_strings(1) % whole string is 1 unit here

%% check if a number is prime?
% a harder bit of code than you'd think...
% create a separate .m file called --> isitPrime.m
% store the .m file in the same folder as this script
% make sure you the folder than contains both files is your current folder
% on the left panel
clc,clearvars, clear all, format compact

N = 71;
isitPrime(N)

N_array = 40:90;
listofPrimes = []; % define an empty matix
j = 0; % count of how many primse we have

for i = 1:length(N_array)
    if isitPrime(N_array(i)) == 1
        j = j + 1;
        listofPrimes(j) = N_array(i); % store current number
    end
end

disp(" ")
disp("Prime numbers are: ")
disp(listofPrimes)

%% Alternative Method to above
clc, clearvars

listofPrimes = [];
N_array = 40:90;

for i = N_array % go thru the values in N_array
    if isitPrime(i) == 1
        listofPrimes(end+1) = i;
    end
end

disp(" ")
disp("Prime numbers are: ")
disp(listofPrimes)







