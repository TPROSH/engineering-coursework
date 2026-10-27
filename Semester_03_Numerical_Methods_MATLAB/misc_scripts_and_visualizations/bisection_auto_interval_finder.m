% bisection_auto_interval.m
% Scans a range to find sign-changing intervals for a given function
% and then runs the bisection method on a chosen interval (or all intervals).

clear; clc;

% === Define the function here ===
y = @(x) 2*(x.^2) - 9*x + 4;   % <-- change this if you want

% === Scan parameters (press Enter to accept the default) ===
start_str = input('Scan start (default -20): ','s');
if isempty(start_str), a = -20; else a = str2double(start_str); end
end_str = input('Scan end   (default 20): ','s');
if isempty(end_str), b = 20; else b = str2double(end_str); end
step_str = input('Scan step  (default 0.5): ','s');
if isempty(step_str), step = 0.5; else step = str2double(step_str); end

if isnan(a) || isnan(b) || isnan(step) || step <= 0
    error('Invalid scan parameters. Please run again with numeric values.');
end

% Build grid and search for sign changes
xs = a:step:b;
intervals = [];
for k = 1:length(xs)-1
    y1 = y(xs(k));
    y2 = y(xs(k+1));
    if isnan(y1) || isnan(y2)
        continue;
    end
    if y1 == 0
        intervals = [intervals; xs(k) xs(k)]; %#ok<AGROW>
    elseif y1 * y2 < 0
        intervals = [intervals; xs(k) xs(k+1)]; %#ok<AGROW>
    end
end

if isempty(intervals)
    fprintf('No sign-change intervals found in [%g, %g] with step %g.\n', a, b, step);
    return;
end

% Display found intervals
fprintf('\nFound %d interval(s) with a sign change:\n', size(intervals,1));
for i = 1:size(intervals,1)
    fprintf('  %d: [%g, %g]\n', i, intervals(i,1), intervals(i,2));
end

sel_str = input('\nChoose interval index to run bisection on (default 1).\nEnter 0 to run on ALL intervals: ','s');
if isempty(sel_str), sel = 1; else sel = floor(str2double(sel_str)); end
if isnan(sel) || sel < 0 || sel > size(intervals,1)
    error('Invalid selection.');
end

% Bisection parameters
tol = 1e-6;
max_iter = 1000;

function [root, iter] = run_bisection(yfun, x1, x2, tol, max_iter)
    if yfun(x1) == 0
        root = x1; iter = 0; return
    end
    if yfun(x2) == 0
        root = x2; iter = 0; return
    end
    for iter = 1:max_iter
        xc = (x1 + x2)/2;
        if abs(yfun(xc)) < tol
            root = xc; return
        end
        if yfun(x1) * yfun(xc) < 0
            x2 = xc;
        else
            x1 = xc;
        end
        if abs(x2 - x1) < tol
            root = (x1 + x2)/2; return
        end
    end
    error('Bisection did not converge in %d iterations', max_iter);
end

% Run on chosen interval(s)
if sel == 0
    fprintf('\nRunning bisection on all intervals...\n');
    for i = 1:size(intervals,1)
        x1 = intervals(i,1); x2 = intervals(i,2);
        [r, it] = run_bisection(y, x1, x2, tol, max_iter);
        fprintf('Interval %d [%g, %g] -> Root: %g (iterations: %d)\n', i, x1, x2, r, it);
    end
else
    x1 = intervals(sel,1); x2 = intervals(sel,2);
    [root, iter] = run_bisection(y, x1, x2, tol, max_iter);
    fprintf('\nSelected interval [%g, %g]\n', x1, x2);
    fprintf('Root: %g\nIterations: %d\n', root, iter);
end

fprintf('\nDone.\n');
