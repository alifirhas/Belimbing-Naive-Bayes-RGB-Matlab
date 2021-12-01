function [resize] = resize1(a)
resize = [];
%a=imread('belimbing.jpeg');
[rows,columns,layers]=size(a)
i=1;j=1;k=1;
c=zeros(rows/2,columns/2,layers);
c=uint8(c);
%figure
%imshow(a) % Display BEFORE casting to double.
a = double(a);
for x=1:2:rows-1;
  for y=1:2:columns-1;
    for z=1:layers;
      c(i,j,k)=1/4*(a(x,y,z)+a(x,y+1,z)+a(x+1,y,z)+a(x+1,y+1,z));
      k=k+1;
    end
    j=j+1;
    k=1;
  end
  i=i+1;
  j=1;
  k=1;
end
%axis on;
%figure, 
%imshow(c)
%axis on;
resize = [resize c];
end