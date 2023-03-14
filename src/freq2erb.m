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
function erb=freq2erb(freq)
%# FREQ2ERB - Finds the erb for a freq. in Hz

%# references
%#[1]  ``A Model for the Prediction of Thresholds, Loudness, and Partial 
%#        Loudness'' Moore B.C.J., Glasberg B.R. and Baer T., Journal of the 
%#       Audio Engineering Society, vol. 45, no. 4, April 1997, pp.224-40.

c1=24.673;
c2=4.368;
c3=(2302.6/(c1 * c2));

erb=(c3*log10((c2 * freq/1000.0) + 1.0));
return;
