function xr = bisec2(f,xl,xu,es)
% x = sym('x') console
% Substitute in 'x' the xl value in f(function) and save in fxl
fxl = subs(f,xl);
% Do the same but, now substitute xu in f and save in fxl
fxu = subs(f,xu);

% if product of evaluation of f(xl) && f(xu), there's no root
while fxl*fxu > 0
    disp('This function does not have root');
    xl = input('Enter a new xl: ');
    xu = input('Enter a new xu: ');
    fxl = subs(f,xl);
    fxu = subs(f,xu);
end

% f(xl) && f(xu) are valid
error = 100;                % starting value
n = 1;                      % first step
xr(n) = (xl+xu)/2;          % (n) save in array, bisecction operation

while error > es            % calculte xr
    
    fxr = subs(f,xr(n));    % get f(xr)
    
    if fxl*fxr < 0          % find in which side is the root 
        xu = xr(n);         % left
        fxu = fxr;          %#ok<NASGU>
    else
        xl = xr(n);         % right
        fxl = fxr;
    end

    xr(n+1) = (xl+xu)/2;
    error = abs((xr(n+1)-xr(n))/xr(n+1))*100;
    n = n+1;
end
fprintf("\nIterations: \t%d\n",n);
fprintf("\n\tResulting xr through calculations\n");