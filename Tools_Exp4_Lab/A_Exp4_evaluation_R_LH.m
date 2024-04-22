ActPath = pwd;
%Pfad für Funktionen
addpath([ActPath '/Functions'])


%Auswertung der Ankerparameter
cd('../Data')
[File,Path] = uigetfile({'*.mat'},'Select measurement data files for evaluation of H-bridge losses','MultiSelect','on');
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
            V4_GUI_R_VH(Time,U_B,i_A,v_rot,PWM_EM,Infos)
        end
    else
        Infos.fileName = File;
        load(fullfile(Path,File))
        if exist('Zeit','var')
            Time = Zeit;
            clear Zeit
        end
        V4_GUI_R_VH(Time,U_B,i_A,v_rot,PWM_EM,Infos)
    end
end

clear ActPath File Path Time x_lin v_lin x_rot v_rot Status U_B i_A PWM_EM a a_x a_z i Infos