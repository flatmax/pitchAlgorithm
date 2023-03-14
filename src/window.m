function windows=window(data, wSize)
  %# this function windows 'data' into windows of 'wSize'
  [r,N]=size(data);
  if N>r
    data=data';
  end
  [N,c]=size(data);
  count=floor(N/wSize);
  remainder=N-count*wSize;
  windows=reshape(data(1:count*wSize),wSize,count)';
  windows(count+1,1:remainder)=data((count*wSize+1):(count*wSize+remainder))';
return