%# Copyright 2001,2002 Matt Flax <flatmax@ieee.org>
%# This file is part of the MFFM Pitch algorithm.
%#
%# MFFM Pitch algorithm is free software; you can 
%# redistribute it and/or modify
%# it under the terms of the GNU General Public License as published by
%# the Free Software Foundation; either version 2 of the License, or
%# (at your option) any later version.
%#
%# MFFM Pitch algorithm is distributed in the hope that it will be useful,
%# but WITHOUT ANY WARRANTY; without even the implied warranty of
%# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%# GNU General Public License for more details.
%#
%# You have received a copy of the GNU General Public License
%# along with the MFFM Pitch algorithm



%# Author MFFM flatmax at ieee dot org
%# This file attempts to mimick the nature of my C++ code which computes
%# the same information.
%# It is believed that SMALL differences arise from altered precision
%# and fft code base, as well as other small factors. In any case these
%# don't alter the general nature of the results.

x=auload('./C4.chord.wav'); %# load in the audio data
x=32000*x; %# conform to the dynamic range of 16 bits
c4=window(x,1024); %# split the waveform into small windows
c4=c4'; %# flip for the fft
[r1,c1]=size(c4);
C4=abs(fft(c4));
[r,c]=size(C4);
if r1!=r
  C4=C4';
end
C4=C4(:,1:c/2);
C4=C4.^2;
%# run the pitch algorithm
[maxLoc, lags1, lags2]=findPitch9 (C4');
