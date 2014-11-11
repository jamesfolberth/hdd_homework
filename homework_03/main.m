function [] = main()
persistent H

if isempty(H)
   H = loadlinks();
end   

alpha = 0.95;
[G,v] = google_matrix(H, alpha);

end
