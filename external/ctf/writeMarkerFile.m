function writeMarkerFile(MarkerFile,marker);

%  Version 1.0   27 Oct. 2006

%   Prepares a CTF Markerfile.
%   The MarkerFile format is defined in document CTF MEG File Formats, PN900-0088.

%   Inputs :
%    Structure marker in the format prepared by readMarkerFile.m.  In cases where 
%    only some of the trials of a data set are being written from MATLAB to a data set,
%    be careful to match the trial identification to the data.
%
%    Trial numbering in structure marker starts at 1, but the numbering in the marker
%    file starts at 0.

%    The dataset (i.e. directory) must be created before calling writeMarkerFile.

%  Output : Marker file with name datasetname\Markerfile.mrk

%  Check input marker.

if nargin==0
  fprintf(['writeMarkerFile:  Version 1.0   27 Oct. 2006\n',...
      '\twriteMarkerFile(MarkerFile,marker) creates a CTF dataset MarkerFile ',...
      'from structure array marker.\n',...
      '\tStructure array marker is in the format created by function ',...
      'readMarkerFile.\n\n',...
      '\twriteMarkerFile decrements trial numbers by 1 so the first dataset ',...
      'trial in MarkerFile is trial 0.\n\n',... 
      '\tThe MarkerFile format is defined in document "CTF MEG File Formats",',...
      ' PN900-0088.\n\n']);
  return
end


if exist('marker')==0
  fprintf('writeMarkerFile:  Structure marker is not defined.\n');
  return
elseif isempty(marker)
  fprintf('writeMarkerFile:  Structure marker is empty.\n');
  return
elseif ~isstruct(marker)
  fprintf('writeMarkerFile:  Input argument marker is not a structure.\n');
  return
end

%  Check MarkerFile
if exist('MarkerFile')~=1;MarkerFile=char([]);end
if isempty(MarkerFile)
  fprintf('writeMarkerFile:  Must specify a MarkerFile.\n');
  return
elseif ~ischar(MarkerFile)
  fprintf('writeMarkerFile:  MarkerFile must be a character string.\n');
  return
end

fid=fopen(MarkerFile,'w','ieee-be');

%  Generate datasetname from MarkerFile.
ksep=max([0 strfind(MarkerFile,filesep)]);
datasetname=MarkerFile(1:ksep-1);
if isempty(datasetname);datasetname=cd;end

nMarker=length(marker);

fprintf(fid,'PATH OF DATASET:\n%s\n\n\n',datasetname);
fprintf(fid,'NUMBER OF MARKERS:\n%d\n\n\n',nMarker);

for k=1:nMarker
  if ~any(marker(k).ClassGroupId==[0 3]);
    fprintf('write_MarkerFile: marker(%d).ClassGroupId=%d.  Only 0 and 3 are allowed.\n',...
      marker(k).ClassGroutpId);
    continue;
  end
  if k==1           % Add sign character to make output match the output of Acq.
    sgn=char([]);   % DataEditor (5.3.0-experimental-linux-20060918). 
  else              % There should be no real significance to the sign.
    sgn='+';
  end
  No_of_Samples=prod(size(marker(k).time));
  fprintf(fid,'CLASSGROUPID:\n%s%d\nNAME:\n%s\nCOMMENT:\n%s\n',...
    sgn,marker(k).ClassGroupId,marker(k).Name,marker(k).Comment);
  fprintf(fid,'COLOR:\n%s\nEDITABLE:\n%s\nCLASSID:\n%s%d\n',...
    marker(k).Color,marker(k).Editable,sgn,marker(k).ClassId);
  if marker(k).ClassGroupId==0
    fprintf(fid,'BITNUMBER:\n%d\nPOLARITY:\n%s\nSOURCE:\n%s\nTHRESHOLD:\n%3.1f\n',...
      marker(k).BitNumber,marker(k).Polarity,marker(k).Source,marker(k).Threshold);
  end
  fprintf(fid,'NUMBER OF SAMPLES:\n%d\n',No_of_Samples);
  fprintf(fid,'LIST OF SAMPLES:\nTRIAL NUMBER\t\tTIME FROM SYNC POINT (in seconds)\n');
  marker(k).trial=reshape(marker(k).trial,1,No_of_Samples);
  marker(k).time=reshape(marker(k).time,1,No_of_Samples);
  
  % Format with no signs on trail numbers and no signs on positive time and 1e-5s accuracy
  %fprintf(fid,'%20d\t\t\t\t%20.5f\n',[marker(k).trial-1;marker(k).time]);
  
  % Format to match the MarkerFile generated by Acq (UCL 20060913) 
  % and DataEditor (5.3.0-experimental-linux-20060918).  
  % Unsigned trial number, signed time.
  fprintf(fid,'%20d\t\t\t\t%+20.12g\n',[marker(k).trial-1;marker(k).time]);
  
  fprintf(fid,'\n\n');
end
fclose(fid);
return
