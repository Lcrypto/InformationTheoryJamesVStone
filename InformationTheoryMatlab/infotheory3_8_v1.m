%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Demonstration code for Information Theory: A Tutorial Introduction, JV Stone.
% Copied with kind permission from Neal Patwari.
% The MatLab code below is version R2013b. 
% This code can be downloaded from
% http://jim-stone.staff.shef.ac.uk/InformationTheoryBook.
% This file: infotheory_3_8_v1.m
% Purpose: Estimate the entropy of a two letter sequence from a sequence of English text.
% Printed output:
% fprintf('Average entropy of each letter in each pair is H=%.4f bits/letter.\n',H);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
labelfontsize=20;

% Consider characters ' abcdefghijklmnopqrstuvwxyz'
considerChars = 'abcdefghijklmnopqrstuvwxyz ';
count = zeros(length(considerChars)); % 27 x 27 array of letter pair counts

% Set name of text file to be read.
fname = 'romeo.txt';
fid   = fopen(fname);
tline = fgets(fid);
lastLet = '';
while (tline ~= -1),
    tline = [lastLet tline];
    substr = lower(tline(find(isletter(tline) | tline == 32)));
    ordLet = charToOrderJVS(substr);
    % increment 2D array of letter pairs
    for i=1:length(ordLet)-1,
        count(ordLet(i), ordLet(i+1)) = count(ordLet(i), ordLet(i+1)) + 1;
    end
    if ~isempty(ordLet),
        lastLet = ordLet(end);
    else
        lastLet = '';
    end
    tline = fgets(fid);
end
fclose(fid);

% Convert counts to proportions.
p = count./sum(count(:));
p1=p(:);
H2 = entropy_from_probabilities(p1);
H = H2/2; % H2 is entropy per pair of letters, so divide by 2 for each letter.
fprintf('Average entropy of each letter in each pair is H=%.4f bits/letter.\n',H);

% Plot output distribution as 2D image.
figure(2);
p1=p(2:27,2:27);
imagesc(1:27, 1:27, log(p))
set(gca,'FontSize',24)
set(gca,'xTick',[1, 5, 10, 15, 20,  27])
set(gca,'xTickLabel',{ 'a', 'e', 'j', 'o', 't',  'sp'});
set(gca,'yTick',[1, 5, 10, 15, 20,  27])
set(gca,'yTickLabel',{ 'a', 'e', 'j', 'o', 't',  'sp'});
xlabel('Character')
ylabel('Character')
colormap(gray);
axis equal
axis tight

% Plot output distribution as 2D histogram.
figure(1);
bar3(1:27,p);
[az el]=view;
view([az+5,el]);
colormap([1 1 1]*0.8);
rotate3d on;
set(gca,'FontSize',labelfontsize)
set(gca,'xTick',[1, 5, 10, 15, 20,  27]);
set(gca,'xTickLabel',{ 'a', 'e', 'j', 'o', 't',  'sp'},'FontSize',labelfontsize);
set(gca,'FontSize',24);
set(gca,'yTick',[1, 5, 10, 15, 20,  27])
set(gca,'yTickLabel',{ 'a', 'e', 'j', 'o', 't',  'sp'},'FontSize',labelfontsize);
set(gca,'xlim',[1 27]);
set(gca,'ylim',[1 27]);
zlabel('Relative frequency','FontSize',labelfontsize);
set(gca,'Linewidth',2);
set(gca,'GridLineStyle','-');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF FILE.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%