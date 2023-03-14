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
function indexArray=perceptual(size, sampleFreq, rounded)

  %# this function indexes frequenciy bins to an ERB scale
  %# Takes as input the freq. bin count and the sample frequency

  if !exist('freq2erb')
    LOADPATH=[LOADPATH '/home/flatmax/research/masking/octave:']
  end

  if nargin==2
    rounded=1;
  end

  fs=sampleFreq;
  highERB=freq2erb(fs/2.0);
  factor=highERB/size;
  scale=size/(fs/2.0);
  index=0:factor:(highERB-factor);
  indexArray=1+round(scale*erb2freq(index));
end