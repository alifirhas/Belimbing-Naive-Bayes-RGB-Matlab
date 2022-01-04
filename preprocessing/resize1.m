function [resize] = resize1(a)
%a=imread('belimbing.jpeg');
resize = [];
[rows,columns,layers]=size(a)%ukuran array
i=1;j=1;k=1;
%simpan array dan bagi 2
c=zeros(round(rows/2),round(columns/2),layers); 
c=uint8(c);
%figure
%imshow(a) % Display BEFORE casting to double.
a = double(a);
for x=1:2:rows-1; %perulangan sebanyak row-1 dengan 2 step
  for y=1:2:columns-1; %perulangan sebanyak col-1 dengan 2 step
    for z=1:layers; %perulangan sebanyak layer
        %rata - rata piksel 4x4 ketetanggaan
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
resize = [resize c];
% axis on;
% figure, 
% imshow(c)
% axis on;
end