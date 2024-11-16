%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Demonstration code for Information Theory: A Tutorial Introduction, JV Stone.
% Copyright: 2014, JV Stone, Psychology Department, Sheffield University, Sheffield, England.
% The MatLab code below is version R2013b. 
% This code can be downloaded from
% http://jim-stone.staff.shef.ac.uk/InformationTheoryBook.
% This file: infotheory1_6_v2.m
% Printed output:
% Entropy of binary image is Hbinary = 0.8505 bits/pixel.
% Entropy of image grey-levels is H = 7.8377 bits/pixel.
% Entropy of grey-level differences is Hdiff = 5.9356 bits/pixel.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
% Set figure fonts.
labelfontsize=20;
xlabelfontsize=20;
labelfontname='Arial';
% set random number seeds.
s=1; rand('seed',s); randn('seed',s);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure 1.8
% MAKE BINARY IMAGE. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read in figure from file.
% image is 299 x 344 x 8 bd (unsigned integer of one byte per pixel).
X = imread('image1_6.jpg');
Xbinary=X>150; 
figure(1);imagesc(Xbinary);
colormap(gray); axis off;
set(gca,'FontSize',labelfontsize); 
title('Binary image');

% Find entropy of binary image. 
x=Xbinary(:);
n=length(x); % n = 102,856 pixels
p1=sum(x)/n;
p0=sum(~x)/n;
Hbinary = -p0*log2(p0) -p1*log2(p1);
fprintf('Entropy of binary image is Hbinary = %.4f bits/pixel.\n',Hbinary);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure 1.9a
% GREY-LEVEL IMAGE. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Show figure.
figure(2);  
imagesc(X);
axis off; 
colormap(gray);
title('Image of grey-levels');
set(gca,'FontSize',labelfontsize); 

% entropy of 8 bd image, compressed image = 45,180 bytes
Xdouble=double(X); % convert pixel values to doubles.
% make image into 1D vector of doubles
Xdouble1D = Xdouble(:);

% Make 256-bin histogram of data.
% Could use hist function for this, but code below is more transparent.
pp=0;                       % total probability
H=0;                        % entropy
ps=zeros(1,256);            % proportions of pixels at each of 256 grey-levels
ns=zeros(1,256);            % numbers of pixels at each of 256 grey-levels
for i=0:255                 % for each of 256 grey-levels
    ni = sum(i==Xdouble1D); % number of pixels with grey-level=i
    ns(i+1) = ni;           % update counts  vector
    p = ni/n;               % proportion of all pixels with grey-level=i
    ps(i+1) = p;            % update ps  vector
    h = -p*log2(p);         % find surprisal of this bin
    H=h+H;                  % update entropy
    pp=pp+p;                % update total prob (should sum to 1)
end
fprintf('Entropy of image grey-levels is H = %.4f bits/pixel.\n',H);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure 1.9b
% Plot histogram of grey levels
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3);     
plot([0:255],[ns],'k','LineWidth',2);
set(gca,'XLim',[0 255]);
title('Histogram of image grey-levels');
xlabel('Grey level, x');
ylabel('Number of pixels');
set(gca,'FontSize',labelfontsize); 
set(gca,'Linewidth',2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure 1.11a
% Grey level differences
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Xdoublediff1D = diff(Xdouble1D); % find differences between adjacent pixe grey-levels.

% Make image of grey-level differences
% Here we depart from text a bit by taking differences within each row,
% this precludes big jumps which can occur between end of one row and
% start of next row.
[nr nc]=size(X);
diffs = zeros(nr,nc-1);
for r=1:nr
    row = Xdouble(r,:);
    for c=1:nc-1
        d=row(c+1)-row(c);
        diffs(r,c)=d;
    end
end
diffs0=diffs;

% Replace each difference value>63 with 63.
ncm1=nc-1;
for r=1:nr
    for c=1:ncm1
        x=diffs(r,c);
        if abs(x)>63
            diffs(r,c)=63*sign(x);
        end
    end
end

% Show difference image.
figure(4);
imagesc(diffs); 
colormap(gray);    
set(gca,'Linewidth',2);
axis off;
title('Image of grey-level differences');
set(gca,'FontSize',labelfontsize); 

% Find out what proportion of difference values are captured by t.
% Set threshold for difference.
t=64;
propOfDiffs = sum(Xdoublediff1D>=-t & Xdoublediff1D<=t)/len(Xdoublediff1D);
% fprintf('Proportion of difference values captured by t=%d is %.4f.\n',t,propOfDiffs);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure 1.11b
% Make histogram of grey-level differences.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pp=0;H=0;N=0;ps=[];ns=[];
diffs1d=diffs0(:);
for i=-t:t
    ni=sum(i==diffs1d);
    ns = [ns ni];
end

% Plot histogram of grey levels
figure(5);     
%set(gca,'FontSize',20); 
plot([-t:t],ns,'k','LineWidth',2);
set(gca,'XLim',[-t t]);
title('Histogram of grey-level differences');
xlabel('Grey level difference \Deltax');
ylabel('Number of pixel differences = \Deltax');
set(gca,'FontSize',labelfontsize); 
set(gca,'Linewidth',2);

% Find entropy of grey level differences
[ns x]=hist(diffs1d,511);
ps=ns/sum(ns)+eps;
ind=find(ps>0);
ps=ps(ind);
Hdiff = -ps*log2(ps');
fprintf('Entropy of grey-level differences is Hdiff = %.4f bits/pixel.\n',Hdiff);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%