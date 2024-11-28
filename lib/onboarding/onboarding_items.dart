import 'onboarding_info.dart';

class OnboardingItems{
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "İlaç Takvimi",
        descriptions: "İlaçlarınızı gün ve saat bazında planlayarak düzenli bir şekilde kullanın.",
        image: "assets/calendar-6612_256.gif"),

    OnboardingInfo(
        title: "Gemini",
        descriptions: "İlaçlar hakkında detaylı bilgi almak için yapay zeka destekli rehberimizden yararlanın.",
        image: "assets/talking-1988_256.gif"),

    OnboardingInfo(
        title: "Hatırlatıcı Bildirim",
        descriptions: "Belirlediğiniz zamanlarda hatırlatıcı bildirimler alarak ilaçlarınızı unutmayın.",
        image: "assets/clock-4495_256.gif"),

  ];
}