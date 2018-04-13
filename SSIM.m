
% ref = imread('pout.tif');
% A = imnoise(ref,'salt & pepper', 0.02);
% 
% [ssimval, ssimmap] = ssim(A,ref);
%   
% fprintf('The SSIM value is %0.4f\n\n',ssimval);

srcDirName = 'D:/M.Tech Capstone Project/Journal/2_MPEF with JPEG/1_Compressed Image Frames/Adel_dyn/' ;
dstDirName = 'D:/M.Tech Capstone Project/Journal/2_MPEF with JPEG/2_Compressed MPEG/Adel_dyn/' ;
srcDir=dir(srcDirName); 
dstDir=dir(dstDirName);

tssim = 0 ;
count = 0 ;

for k = 3 : length(srcDir)
   srcFullName = strcat(srcDirName , srcDir(k).name) ;
   dstFullName = strcat(dstDirName , dstDir(k).name) ;
   
   srcImage = imread(srcFullName) ;
   dstImage = imread(dstFullName) ;
   
   [ssimval, ssimmap] = ssim(srcImage,dstImage) ;
   
   %disp(srcFullName + ", " + dstFullName + ", " + ssimval) ;
   
   tssim =  tssim +  ssimval ;
   count = count + 1 ;
end

avgssim = tssim/count ;
disp(avgssim + ", "  + count) ;
