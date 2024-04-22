%Laden der Daten
[File,Path] = uigetfile('*.mat','Select MATLAB data file');
if ~isnumeric(File)
    %File öffnen
    load(fullfile(Path,File))
    Time(end) = round(Time(end),3);
end