import 'package:just_audio/just_audio.dart';

class AudioManager {
  final AudioPlayer player = AudioPlayer();
  final AudioPlayer soundsPlayer = AudioPlayer();
  final AudioPlayer soundsPlayer2 = AudioPlayer();

  AudioManager() {
    player.setLoopMode(LoopMode.all);
    player.setVolume(0.15);
    soundsPlayer.setVolume(0.15);
    soundsPlayer2.setVolume(0.15);
  }

  playTicking() async {
    await player.setFilePath('assets/ticking.wav');
    await player.play();
  }

  playNextParticipant() async {
    await soundsPlayer.setFilePath('assets/next_participant.wav');
    await soundsPlayer.play();
  }

  playGong() async {
    await soundsPlayer2.setFilePath('assets/gong.wav');
    await soundsPlayer2.play();
  }

  playAlarm() async {
    await player.setFilePath('assets/annoying_alarm.wav');
    await player.play();
  }

  playCongratulations() async {
    await soundsPlayer.setFilePath('assets/dobra_robota.mp3');
    await soundsPlayer.play();
  }

  stopAudio() async {
    await player.stop();
    await soundsPlayer2.stop();
  }
}
