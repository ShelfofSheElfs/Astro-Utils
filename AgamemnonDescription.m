1;
function agamemnonTransit(days=4331)
  ag = [5.2859443, 0.0671889, 21.755921, 82.358383, 338.02013, 2459738];
  l4 = [5.2038, 0.0489, 1.304, 213.867, 160.464, 2459242];

  agc = sqrt((ag(1,2)^2)-(ag(1,1)^2));
  l4c = sqrt((l4(1,2)^2)-(l4(1,1)^2));

  t = 2460799;

  figure; hold on
  xlabel("x");
  ylabel("y");
  zlabel("z");
  axis(limit = "square");

  for i=1:1:days
    agtheta = (t-ag(1,6))*0.0810998;
    l4theta = (t-l4(1,6))*0.0831294;
    agx = agc+ag(1,1)*cosd(agtheta);
    l4x = l4c+l4(1,1)*cosd(l4theta);
    agy = (ag(1,1)*sqrt(1-(ag(1,2)^2)))+sqrt(1-(ag(1,2)^2))*sind(agtheta);
    l4y = (5.19757458691*sqrt(1-(l4(1,2)^2)))*sind(l4theta);
    agz = agx*sind(ag(1,3));
    l4z = agx*sind(l4(1,3));

    plot3(abs(agx)-abs(l4x), abs(agy)-abs(l4y), abs(agz)-abs(l4z), ".");

    t+=10;
    if agtheta > 360
      agtheta-=360;
    endif
    if l4theta > 360
      l4theta-=360;
    endif
  endfor
endfunction
