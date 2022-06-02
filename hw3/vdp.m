function dy = vdp(t, y, mu)
    %y1' = y2
    %y2' = e(1-y1^2)y2-y1
    %dy y2 y2'
    dy = zeros(2,1);
    dy(1,1) = y(2);
    dy(2,1) = mu*(1-y(1)^2)*y(2) - y(1);