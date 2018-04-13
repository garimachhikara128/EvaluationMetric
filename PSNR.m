
% ref = imread('pout.tif');
% A = imnoise(ref,'salt & pepper', 0.02);
% 
% [peaksnr, snr]  = psnr(A,ref) ;
% 
% fprintf('The Peak-SNR value is %0.4f\n\n', peaksnr);

srcDirName = 'D:/M.Tech Capstone Project/Journal/2_MPEF with JPEG/1_Compressed Image Frames/lou_dyn/' ;
dstDirName = 'D:/M.Tech Capstone Project/Journal/2_MPEF with JPEG/2_Compressed MPEG/lou_dyn/' ;
srcDir=dir(srcDirName); 
dstDir=dir(dstDirName);

tpsnr = 0 ;
count = 0 ;

for k = 3 : length(srcDir)
   srcFullName = strcat(srcDirName , srcDir(k).name) ;
   dstFullName = strcat(dstDirName , dstDir(k).name) ;
   
   srcImage = imread(srcFullName) ;
   dstImage = imread(dstFullName) ;
   
   [peaksnr, snr]  = psnr(srcImage,dstImage) ;
   
   %disp(srcFullName + ", " + dstFullName + ", " + peaksnr) ;
   
   tpsnr =  tpsnr +  peaksnr ;
   count = count + 1 ;
end

avgpsnr = tpsnr/count ;
disp(avgpsnr + ", "  + count) ;
