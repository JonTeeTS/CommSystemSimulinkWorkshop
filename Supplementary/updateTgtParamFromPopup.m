function myException = ...
    updateTgtParamFromPopup(block, targetBlock, param, valList, popupName)
% UPDATETGTPARAMFROMPOPUP Update target parameter in target block from the 
%                         popup control.
%
% Inputs: block       - the 'Model Parameters' block
%         targetBlock - the block to receive the parameter
%         param       - name of the parameter in the targetBlock to be 
%                       changed
%         valList     - cell array of strings of possible values for the 
%                       parameter of the lower level block
%         popupName   - name of the parameter in the 'Model Parameters' 
%                       block whose value will be written to 'param'
%
% Outputs: myException - mException object in case of set_param failure
%
% See also UPDATETGTPARAMFROMEDIT.

%   Copyright 2011 The MathWorks, Inc.

myException = [];
% -- Get variables from mask
WsVar = get_param(block, 'MaskWsVariables');

% -- Get selected value
idx = strncmp(popupName, {WsVar.Name}, length(popupName));
valNew = valList{WsVar(idx).Value};

try
    set_param(targetBlock, param, num2str(valNew));
catch myException
end

% EOF
