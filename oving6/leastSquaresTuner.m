% Simple snippet to tune controller based on least squares error

run("init.m");

Kp_min = 10;
Kp_max = 200;

Kd_min = 0.1;
Kd_max = 10;

record    = inf;
record_kp =   0;
record_ki =   0;

tic
for i=0:0.1:1
    for j=0:0.1:1
        Kp = Kp_min + (Kp_max-Kp_min)*i;
        Kd = Kd_min + (Kd_max-Kd_min)*j;
        run("runSimulation.m");
        score = norm(theta_d_ts.data - theta_ts.data);
        if score < record
            record    = score;
            record_kp =    Kp;
            record_ki =    Kd;
        end
    end
end
toc

record
record_kp
record_ki