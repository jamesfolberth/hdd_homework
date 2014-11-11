function [G,v] = google_matrix(H, alpha)
% Compute the Google matrix given the adjacency matrix 'H' and 
% combination parameter 'alpha'

row_sums = sum(H,2);
a = (row_sums == 0);

% construct a random _positive_ vector with \|v\|_1 = 1
vt = rand([1 size(H,2)]); % uniform (0, 1);
vt = vt/norm(vt,1); 

G = zeros(size(H,1),size(H,2)); % G is not sparse, since vt is not sparse
for i=1:size(H,1)
   if a(i) == 1
      G(i,:) = vt;
   else
      G(i,:) = alpha*H(i,:)/row_sums(i) + (1-alpha)*vt;
   end
end

v = transpose(vt);

end
