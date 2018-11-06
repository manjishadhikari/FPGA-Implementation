fh=fopen('H:\song1.txt','w');
notes='XDXDXXEEEXDDDXGGGXXFFXXDXDXEEEEXDDDDXAAAAXGGXXDDDXDDDXBBBXGGGXFF';
for i=1: size(notes,2)
   if notes(i)=='D'
       K='10011111';
   elseif notes(i)=='X'
           K='00000000';
   elseif notes(i)=='E'
       K='10101111';
   elseif notes(i)=='G'
       K='11001111';
   elseif notes(i)=='A'
       K='11011111';
   
   elseif notes(i)=='C'
       K='00011111';
   elseif notes(i)=='F'
       K='01001111';
   elseif notes(i)=='B'
       K='01111111';
   end
   fprintf(fh,'%s\r\n',K);
     
end
fclose(fh);
fprintf('Done')