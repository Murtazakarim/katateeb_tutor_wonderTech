import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:katateeb_tutor/generated/assets.dart';

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "نعمل سويا كفريق عمل",
    description:
    "أنت أكثر من مجرد معلم معنا، سوف سنعمل سويا بقيم أساسية مشتركة، ونحن معك في كل خطوة على الطريق لمساعدتك على النمو  في حياتك المهنية",
    imgUrl: Assets.imgOnBoardThirdIcon,
  ),
  const OnBoardModel(
    title: "استمتع بإحداث التغيير لدى طلابك",
    description:
    "سنساعدك بكل ما يتعلق بإحداث فرق في حياة الطالب، بداية من إتاحة الخيار لك لاختيار الطالب المتوافق مع خبراتك التعليمية ",
    imgUrl: Assets.imgOnBoardSecondIcon,
  ),
  const OnBoardModel(
    title: "اختر طريقتك المناسبة للعمل",
    description: "عندما تصبح معلما لدينا، فأنت من يحدد طريقة العمل، عليك أن تضع معلومات وجدولك الزمني الخاص، ونحن نهتم بباقي التفاصيل",
    imgUrl: Assets.imgOnBoardFirstIcon,
  ),
];