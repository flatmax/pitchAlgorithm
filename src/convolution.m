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
function lags=convolution(signal1, signal2)
  [r,c]=size(signal1);
  [r2,c2]=size(signal2);

  if (r!=r2 || c!=c2)
    disp("convolution.m: error : signal matrix sizes must match");
    return
  end

  flippedS=fliplr(signal2);

  for R=1:r
    if 1
      S=fft(signal1(R,:));
      FS=fft(flippedS(R,:));
      SFS=S.*FS;
      lags(R,:)=real(ifft(SFS));
    else
      lags(R,:)=conv(signal1(R,:), signal2(R,:));
      size(lags(R,:));
    end
  end
return