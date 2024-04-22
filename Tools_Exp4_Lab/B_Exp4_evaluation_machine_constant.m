ActPath = pwd;
%Pfad f�r Funktionen
addpath([ActPath '\Functions'])

%Pfad f�r Messdaten ausw�hlen
ui_data_path_on = 0;
if ui_data_path_on == 1
    data_path = uigetdir('../Data','Pfad der Messdateien ausw�hlen');
else
    data_path = '../Data';
end
clear ui_data_path_on

%Auswertung der Maschinenkonstante
cd(data_path)
[File,Path] = uigetfile({'*.mat'},'Select measurement data files for evaluation of machine constant','MultiSelect','on');
cd(ActPath)
if ~isnumeric(File)
    if iscell(File)
        for i = 1:length(File)
            Infos.fileName = File{i};
            load(fullfile(Path,File{i}))
            if exist('Zeit','var')
                Time = Zeit;
                clear Zeit
            end
            V4_GUI_Maschinenkonstante(Time,U_B,PWM_EM,i_A,v_rot,Infos)
        end
    else
        Infos.fileName = File;
        load(fullfile(Path,File))
        if exist('Zeit','var')
            Time = Zeit;
            clear Zeit
        end
        V4_GUI_Maschinenkonstante(Time,U_B,PWM_EM,i_A,v_rot,Infos)
    end
end

clear ActPath File Path Time x_lin v_lin x_rot v_rot a a_x a_z U_B i_A PWM_EM Status data_path i