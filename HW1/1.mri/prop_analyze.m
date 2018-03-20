function prop_analyze(brain)
    %% Frontal lobe
    left_frontal_index = [1028, 1003, 1027, 1018, 1020, 1019, 1012, 1014, 1024, 1017, 1032];
    right_frontal_index = left_frontal_index + 1000;
    frontal_index = [left_frontal_index, right_frontal_index];
    frontal = brain_count(brain, frontal_index);

    %% Parietal lobe
    left_parietal_index = [1029, 1008, 1031, 1022, 1025];
    right_parietal_index = left_parietal_index + 1000;
    parietal_index = [left_parietal_index, right_parietal_index];
    parietal = brain_count(brain, parietal_index);

    %% Temporal lobe
    left_temporal_index = [1030, 1015, 1009, 1001, 1007, 1034, 1006, 1033, 1016];
    right_temporal_index = left_temporal_index + 1000;
    temporal_index = [left_temporal_index, right_temporal_index];
    temporal = brain_count(brain, temporal_index);

    %% Occipital lobe
    left_occipital_index = [1011, 1013, 1005, 1021];
    right_occipital_index = left_occipital_index + 1000;
    occipital_index = [left_occipital_index, right_occipital_index];
    occipital = brain_count(brain, occipital_index);

    %% Cortex
    left_cortex_index = 1000:1035;
    right_cortex_index = left_cortex_index + 1000;
    cortex_index = [left_cortex_index, right_cortex_index];
    cortex = brain_count(brain, cortex_index);
    
    %% Print
    prop_frontal= frontal / cortex
    prop_parietal = parietal / cortex
    prop_temporal = temporal / cortex
    prop_occipital = occipital / cortex
        
end