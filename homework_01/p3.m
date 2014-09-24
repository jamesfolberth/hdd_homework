function [] = p3()
   N = 10000;
   n = (1:19).^2;

   for i=1:numel(n)
      X = randn([n(i),N]);
   end
end
