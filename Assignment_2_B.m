y = imread('C:\Users\Khurram\Desktop\Coding\Computer Vision\robot.png');
z = imread('C:\Users\Khurram\Desktop\Coding\Computer Vision\me.jpg');

x=imresize(z,0.15);
%imshow(x);

image(y);
hold on;
image([20 150], [50 295],z);