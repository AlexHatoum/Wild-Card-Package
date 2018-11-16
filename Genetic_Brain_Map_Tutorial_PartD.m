%Finally! Here we go to a matlab script. This script will take those asc files and turn them into the freesurfer MGH files

%****first you want to add freesurfer and the fsfast toolbox to your matlab path.  these probably were downloaded with your freesurfer installation and will
%Will change depending on where freesurfer downloaded on your computer
addpath('.../freesurfer/5.3.0/matlab', '/projects/ics/software/freesurfer/5.3.0/fsfast/toolbox')

%****This overlay will also be in the freesurfer download
overlay = MRIread('.../lh.thickness.fsaverage.mgh');

%****This is the asc file from script C
asc = load('Sample2/rGLeftBehavior.asc');

%This code is fine. no reason to change at all. 
asc_reshaped = reshape(asc(:,5), overlay.volsize)
overlay.vol = fast_mat2vol(asc_reshaped, overlay.volsize);

%This code will write out the mgh file you can use in freesurfer! I tend to plot in freeview (personally) by loading the overlay for thickness (the one I used above)
%and then loading this mgh file on top of it.  That's it and have fun!
MRIwrite(overlay, 'LogAPLeftICUB.mgh');
