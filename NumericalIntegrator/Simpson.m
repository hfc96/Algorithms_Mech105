% Abdulaziz Abuhaimed
% MECH 105
function I = Simpson(x,y)

a = min(x); %lower limit
b = max(x); %upper limit
n=length(x); %number of points

if length(x) ~= length(y) %check if the number of points and the y values match
    error('x and y are not the same length')
end

if sum(x==linspace(a, b, n))~=n %check if the spacing of the give x-axis is evenly spaced
    error('x is not linearly spaced')
end

a = x(1); %used to give width
b = x(3);%used to give width
if mod(n,2) == 1
    %if odd, use standard simpsons
    temp = ones(1,n);
    temp(2:2:end-1) =4;
    temp(3:2:end-2) = 2; %[1 4 2 4 2 4 2 .... 2 4 1]


    I = (b-a)/6*(temp*y'); %evaluate using simpsons
else
    %if even use standard simpsons, then trap to account for last interval
    temp = ones(1,n-1);
    temp(2:2:end-1) =4;
    temp(3:2:end-2) = 2;

        %evaluate using simpsons and trap
    I = (b-a)/6*(temp*y(1:end-1)')+1/2*(x(2)-x(1))*(y(end)+y(end-1));
    warning('Using the trapezoidal rule for the last interval')
end

I=sum(I); %obtain total sum
end