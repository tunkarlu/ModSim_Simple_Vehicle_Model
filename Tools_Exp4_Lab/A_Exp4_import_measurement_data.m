%Laden der Daten
[File,Path] = uigetfile('*.mat','Select MATLAB data file');
if ~isnumeric(File)
    %File �ffnen
    load(fullfile(Path,File))
    Time(end) = round(Time(end),3);
end