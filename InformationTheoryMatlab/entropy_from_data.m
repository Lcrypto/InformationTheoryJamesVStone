function H = entropy_from_data(data,values)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% H = entropy_from_data(data,values)
% Argument: data is a sample of from some probability distribution.
% values is a list of values to be found in data. 
% Returns: An estimate of entropy of data.
% Comment: Uses log base 2, so the answer is in units of bits.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% flatten data
data = data(:);

% Get number of distinct values in data.
nvals = length(values);

% make vector to hold frequencies (counts)
freqs = zeros(nvals,1);
for i=1:nvals
    val = values(i);
    n = sum(val==data);
    if isempty(n)
        n=0;
    end
    freqs(i) = n;
end

% make freqs into proportions
ntot = length(data);
proportions = freqs/ntot;

H = entropy_from_probabilities(proportions);
