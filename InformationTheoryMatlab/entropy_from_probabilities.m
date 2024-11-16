function H = entropy_from_probabilities(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% H = entropy_from_probabilities(p)
% Argument: p is a distribution of probabilities.
% Returns: An estimate of entropy of p.
% Comment: Uses log base 2, so the answer is in units of bits.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Flatten distribution.
p=p(:);

% check for zeros ...
ind=find(p>0);
if isempty(ind)
    error('entropy_from_probabilities: Need at least one +ve probability.');
end

p=p(ind);
H = sum(p.*log2(1./p));