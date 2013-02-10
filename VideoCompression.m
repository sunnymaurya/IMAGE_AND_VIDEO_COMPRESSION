
% sunny kumar maurya video compression
%Reading The Video
xyloObj = mmreader('xylophone.mpg');

%Reading Number of Frames in Video
nFrames=xyloObj.NumberOfFrames 

%Reading width and height of the original video
vidHeight=xyloObj.Height;
vidWidth=xyloObj.Width;

% Defining a movie structure to store original video

mov(1:nFrames)=struct('cdata',zeros(vidHeight,vidWidth,3,'uint8'),'colormap',[ ]);


% Defining a movie structure to store compressed video
mov2(1:nFrames)=struct('cdata',zeros(vidHeight,vidWidth,3,'uint8'),'colormap',[ ])

for k = 1:nFrames
    
%Storing each frame in the cdata of each element of the array of structures
     mov(k).cdata = read(xyloObj,k);
     z=mov(k).cdata;
     
%Compressing Each Frame and displaying it
     X=compress_img(z);
     imshow(X);
     
% Converting Double type compressed image into uint8 encoding
     X=uint8(150*X);
     
%Storing the compressed image in the compressed video structure     
     mov2(k).cdata=X;
   
end

hf1=figure(1)
set(hf1,'position',[150 150 vidHeight vidWidth])
hf2=figure(2)
set(hf2,'position',[150 150 vidHeight vidWidth])

%Playing Original Video
movie(hf1,mov,1,xyloObj.FrameRate);

% Playing Compressed Video
movie(hf2,mov2,1,xyloObj.FrameRate);


 
