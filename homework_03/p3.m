function [] = p3(savefile)
persistent H

% If we need to compute rankings, do it and save to file
if nargin == 0
   if isempty(H)
      H = loadlinks();
   end   
   
   alpha = [0.5 0.75 0.85 0.95 0.99];
  
   rankings = zeros([size(H,2) numel(alpha)]);
   resids = {};
   for i=1:numel(alpha)
      [G,v] = google_matrix(H, alpha(i));
      tic
      [vt,e,vresid] = power_method(G);
      rankings(:,i) = transpose(vt);
      resids{i} = vresid;
      toc
   end
   
   save('rankings.mat','alpha','rankings','resids');

% otherwise print top 25 pages
else
   outfile = 1;

   load(savefile)

   top25 = zeros([25 size(rankings,2)]);
   for i=1:size(rankings,2)
      [~,id] = sort(rankings(:,i),1,'descend');
      top25(:,i) = id(1:25);
   end    

   % print stuff to outfile (could be cout)
   fprintf(outfile, 'alpha = %10.2f%10.2f%10.2f%10.2f%10.2f\n', alpha(1),...
      alpha(2), alpha(3), alpha(4), alpha(5));
   fprintf(outfile, '        %s\n', repmat('=',[1 50]));
   for i=1:25
      fprintf(outfile, '%2d      %10d%10d%10d%10d%10d\n', i, top25(i,1)-1,...
         top25(i,2)-1, top25(i,3)-1, top25(i,4)-1, top25(i,5)-1);
   end

end

end % p3
