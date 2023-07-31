function fn_play_music(_bgm){
	if(!global.sound_enabled){
		return;	
	}
	if(!audio_is_playing(_bgm)){
		audio_play_sound(_bgm, 0, true, 0.4);
	}
}

function fn_play_sound(_snd, _gain=1){
	if(!global.sound_enabled){
		return;
	}
	audio_play_sound(_snd, 0, false, _gain);
}
