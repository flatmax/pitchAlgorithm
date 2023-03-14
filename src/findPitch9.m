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
function [maxLoc, pitchScale1, pitchScale2, afferentSignal]=findPitch9(signal)
  %# signal is a masked spectrogram matrix
  %# which denotes the time slice
  %# perceptualScaling denotes wether correlogram is conducted in the
  %# ERB scale or not

  [r,c]=size(signal);
  %# this is used if the power spectrum is not alread sqrt'd
  signal=sqrt(signal);

  oldSignal=signal;
  erbIndexes=perceptual(c, 44100);
  afferentSignal(:,:)=oldSignal(:,erbIndexes);
  efferentSignal(:,:)=oldSignal;  

  pitchScale1=correlation(afferentSignal, efferentSignal);
  pitchScale2=convolution(afferentSignal, efferentSignal);
  pitchScale1=pitchScale1(:,1:c/2);
  pitchScale2=pitchScale2(:,1:c/2);

  summedL1=sum(pitchScale1);
  summedL2=sum(pitchScale2);

  maxLoc1=find(summedL1==max(summedL1));
  maxLoc2=find(summedL2==max(summedL2));
  maxBins=[maxLoc1 maxLoc2];
  maxLoc=(maxLoc1+maxLoc2)/2;

  xlabel('Pitch Scale');
  ylabel('Salience');
  title("pitch scale salience for the file C4.chord.wav.onsets (alter title if you didn't use the same file)");
  plot(summedL1); hold on;
  plot(summedL2); hold off;
end
