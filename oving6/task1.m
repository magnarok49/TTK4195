% ------ Config ------
run("init.m");

% ------ Subtasks ------
include_sat = 0;
run("testCriticalDamping.m");
run("testCriticalDampingPID.m");

include_sat = 1;
run("testCriticalDamping.m");
run("testCriticalDampingPID.m");