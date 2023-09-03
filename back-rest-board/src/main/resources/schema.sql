-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ssafit_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ssafit_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ssafit_db` DEFAULT CHARACTER SET utf8 ;
USE `ssafit_db` ;

-- -----------------------------------------------------
-- Table `ssafit_db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafit_db`.`user` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(15) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `nickname` VARCHAR(15) NOT NULL,
  `exp` INT NULL DEFAULT 0,
  `age` INT NULL,
  `height` INT NULL,
  `weight` INT NULL,
  PRIMARY KEY (`no`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `nickname_UNIQUE` (`nickname` ASC) VISIBLE)
ENGINE = InnoDB;

INSERT INTO `user` VALUES
(0, "ssafy", "1234", "김싸피", "ssafy@ssafy.com", "관리자", 94, 100, 200, 100),
(0, "jihye", "1119", "변지혜", "jihye@ssafy.com", "디헤", 33, 28, 164, 100),
(0, "hyemin", "1226", "윤혜민", "hyemin@ssafy.com", "헤밍", 50, 27, 158, 300),
(0, "euiseok", "0813", "정의석", "euiseok@ssafy.com", "의서깅", 0, 28, 173, 30),
(0, "kyunghee", "0720", "김경희", "kyunghee@ssafy.com", "히히", 0, 30, 190, 500),
(0, "eunsol", "0210", "김은솔", "eunsol@ssafy.com", "삼솔", 0, 29, 188, 1000),
(0, "sahong", "0000", "박사홍", "sahong@ssafy.com", "한번 더 생각했나요?", 0, 500, 185, 10),
(0, "daegyun", "0526", "박대균", "daegyun@ssafy.com", "대균", 0, 27, 190, 80),
(0, "wonhee", "1205", "이원희", "wonhee@ssafy.com", "2₩2", 0, 28, 164, 65),
(0, "yeji", "1222", "정예지", "yeji@ssafy.com", "예지쨩", 0, 30, 167, 40);

SELECT * FROM `user`;

-- -----------------------------------------------------
-- Table `ssafit_db`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafit_db`.`video` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(100) NULL,
  `channel` VARCHAR(200) NULL,
  `title` VARCHAR(1000) NULL,
  `description` VARCHAR(4000) NULL,
  `language` VARCHAR(45) NULL,
  `category` INT NULL,
  `reg_date` TIMESTAMP NULL DEFAULT NOW(),
  `review_cnt` INT NULL,
  `like_cnt` INT NULL,
  `view_cnt` INT NULL,
  PRIMARY KEY (`no`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;

ALTER TABLE `video` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 비디오 테이블 데이터 넣기
INSERT INTO `video` VALUES
(0, "2pLT-olgUJs", "Chloe Ting", "Get Abs in 2 WEEKS | Abs Workout Challenge", "Abs Abs Abs! Everyone seems to be asking for a QUICK and short schedule, so I put together a 2 weeks schedule to help you get ...", "ko", 24, "2019-08-12 11:45:00", 305713, 8625722, 500925248),
(0, "Tz9d7By2ytQ", "Allblanc TV", "NO GYM FULL BODY WORKOUT (feat. 5 min Tabata) | 5분 전신 타바타 운동", "Hello, Allbengers~! This is Louis. Today's workout is FULL BODY WORKOUT for your fat loss. You can do the routine without gym ...", "ko", 24, "2020-01-16 02:43:30", 7381, 514333, 25331967),
(0, "iOSYLKBk894", "Thankyou BUBU", "무.조.건! 뱃살 빠지는 운동 베스트5", "안녕하세요, Thankyou BUBU입니다! 많은 분들이 다이어트, 운동을 결심하게되는 이유중 하나는 다름아닌 '뱃살' 때문이라고도 할 수 ...", "ko", 24, "2018-01-01 09:44:42", 30254, 301029, 24089732),
(0, "VNQpP6C1fJg", "Thankyou BUBU", "집에서 하는 유산소운동 다이어트 [칼소폭]", "안녕하세요, Thankyou BUBU 입니다! 저희가 운동을 할 때 가장 중점을 두고 생각하는 것은 바로 '시간 대비 운동효율' 입니다. 그래서 ...", "ko", 24, "2017-11-27 09:24:36", 42414, 237663, 20219952),
(0, "T-bVqdhqW2U", "비타민신지니 VitaminJINY", "🔥출렁이는 팔뚝살🔥빨리 빼려면 1달만 이 루틴하세요. (팔뚝살빼는운동/팔뚝살 빨리 빼는법/팔뚝살 완전 제거 운동)", "팔뚝살 #팔뚝살빼는운동 #팔뚝살빨리빼는법 팔뚝살빼는운동 2탄 https://www.youtube.com/watch?v=l8KA8dgbUd0&t=155s ...", "ko", 24, "2020-05-06 09:56:35", 23245, 336812, 18942554),
(0, "Q70jQVPkMnc", "Thankyou BUBU", "허벅지 안쪽살 빨리 빼는 운동 3가지", "많은 다이어터 분들이 다이어트시 다른 부위들에 비해 허벅지살, 하체살 빼는것이 어렵다고 느끼는 이유는 무엇일까요? 우선 하체에는 ...", "ko", 24, "2018-02-05 09:10:20", 65824, 288290, 18577885),
(0, "2Uv1B3kjCOI", "Thankyou BUBU", "아랫뱃살 똥배 폭파 운동", "뱃살때문에 상당히 고민이 많았던 1인으로서... 식단도 열심히 해보고 여러가지 복부관련 동작도 열심히 해보았지만 당시 뱃살이 ...", "ko", 24, "2020-04-19 08:56:27", 21474, 256660, 17077128),
(0, "lKwZ2DU4P-A", "Thankyou BUBU", "집에서 칼로리 불태우는 최고의 유산소운동 [칼소폭 매운맛]", "저희가 이번 영상을 준비할 때 목표로 한 것은 '무조건 힘들기만 한 운동'이 아니라 '기분 좋게 힘든 운동'에 초점을 두었습니다. 그 느낌 ...", "ko", 24, "2020-01-07 09:50:04", 20245, 173952, 15893890),
(0, "6_LYz_XxD-g", "DanoTV", "[EN/CH]눈뜨스:아침에 눈뜨자마자 따라하는 스트레칭 (First Thing in the Morning Stretching, Morning Stretching)ㅣ다노티비", "스트레칭 습관 만들고 돈도 버는 꿀팁! 다노앱에서 스트레칭 따라하고 → 포인트 모아서 식단 할인 받으세요! https://abr.ge/bad0zwa ...", "ko", 24, "2017-11-12 08:25:42", 3889, 119026, 14810770),
(0, "ZW1pnq0b8Hs", "Thankyou BUBU", "1만보 걸으면서 살이 쭉쭉 빠지는 운동 [걸쭉빠 만보]", "만일 단 하나의 운동만 할 수 있고 그것을 평생 해야한다면 저는 주저없이 '걷기'를 선택하겠습니다. 그만큼 걷기는 인간이 할 수 있는 ...", "ko", 24, "2019-04-22 10:15:30", 12031, 143215, 14459784),
(0, "swRNeYw1JkY", "Thankyou BUBU", "하루 15분! 전신 칼로리 불태우는 다이어트 운동", "우리 몸을 흔히들 자동차에 비유하곤 합니다. 자동차는 출발 전 예열 과정을 거치고 주행을 다 하고난 후에는 열을 식혀주어야 합니다.", "ko", 24, "2018-04-16 09:58:36", 18980, 167907, 14050556),
(0, "1uJV1ZmzeoI", "Thankyou BUBU", "하루 7분! 허리둘레 5cm 줄어드는 운동", "옆구리와 허리 주변 불어나는 지방덩어리는 우리 모두의 고민입니다. 조금만 관리를 소홀히해도 눈덩이처럼 불어나는 복부 피하지방 ...", "ko", 24, "2019-12-01 09:01:01", 7936, 183518, 13461276),
(0, "UYHfk45Yi2c", "Thankyou BUBU", "팔뚝 다이어트 운동 베스트4", "대부분의 분들이 팔뚝을 다이어트 운동, 식단조절 등으로 체지방을 빼면 자연스럽게 관리가 되는 운동이 필요없는 부위로 인식하지만, ...", "ko", 24, "2018-01-15 08:41:03", 28009, 179206, 13386213),
(0, "4EKo44DUvjg", "에이핏 afit", "살이 너무 빠지는 죽음의 타바타 운동 (no 층간소음) / Beautiful tabata workout", "안녕하세요 에이핏 주인장 라희입니다 :) 블로그에 문의해본 결과 층간소음 걱정은 없고, 강도는 무지하게 높아야 되고, 시간은 너무 ...", "ko", 24, "2020-05-20 13:41:41", 13421, 198292, 13098053),
(0, "2swcod5RYvU", "삐약스핏 [살빼주는 병맛 다이어트채널]", "[PPIYAK&#39;s FIT]Ejercicio de la parte superior del cuerpo en casa집에서하는 상체운동!Upper body workout at home", "집에서 앉아서 다소곳하게 조져보아요..❤️ 오늘도 저희 영상을 봐주셔서 감사합니다   항상 더 노력해서 신나고 효과좋은 운동영상 ...", "ko", 24, "2019-07-01 11:54:30", 20992, 124472, 13075655),
(0, "Kymv9On2-VA", "소미핏 SOMIFIT", "승마살, 힙딥, 피치힙! 한방에 해결! 애플힙 일등공신 소미핏 중둔근운동! (한번만해도 효과보장!)", "1#운동 #홈트 #미서원 #somifit #다이어트 #중둔근 #힙딥 #애플힙 #승마살 #중둔근 강화 안녕하세요! 여러분 미서원 입니다. 오늘은 ...", "ko", 24, "2019-09-25 12:35:31", 11483, 324770, 12542394),
(0, "bMhMRyiGlYQ", "[햄지]Hamzy", "리얼먹방:) 얼큰순두부찌개 &amp; 계란밥★운동후 단백질보충ㅣSundubu-jjigae (Soft Tofu Soup)ㅣREAL SOUNDㅣASMR MUKBANGㅣEATING SHOWㅣ", "Today's menu is Sundubu-jjigae (Soft Tofu Soup) & Rice with Fried eggs(ft.Juicy Strawberry )☆ I really appreciate to my ...", "ko", 24, "2020-02-24 12:46:13", 3144, 124074, 11785766),
(0, "nOGT4lXlSHw", "Thankyou BUBU", "전신/하체비만/상체비만/골반교정/승모근/종아리알 스트레칭 이거 하나로 끝!", "사실 저희 부부가 이번 영상을 찍기로 마음먹었을 때 목표로 했던 것은 단순하고도 명확했습니다. '매일 함께 할 수 있는 만능 스트레칭' ...", "ko", 24, "2019-12-08 09:41:46", 5766, 125468, 11516012),
(0, "7TLk7pscICk", "소미핏 SOMIFIT", "(Sub)누워서하는 5분 복부운동!! 효과보장! (매일 2주만 해보세요!)", "더 많은 언어는 자동번역을 설정 해주세요 (PC모드) ♥ 소미핏 무료 운동 프로그램: https://www.staysomifit.com/ ♥ 인스타그램: ...", "ko", 24, "2018-02-17 20:21:37", 7667, 206737, 11284379),
(0, "MWnD6DhLjyc", "Thankyou BUBU", "집에서 칼로리 소모 폭탄 걷기 운동 [칼소폭3]", "왜 하필 홈트 인가요? 라는 질문에 문득 왜 우리가 시작하게 되었고 어떻게 여기까지 오게 되었는지를 생각해보았습니다. 사실 우리의 ...", "ko", 24, "2019-06-23 09:42:02", 11194, 122663, 11220276),
(0, "hR1ZgDQqyVI", "비타민신지니 VitaminJINY", "🔥볼록 튀어나온 아랫뱃살🔥무조건 빠지는 역대급 뱃살폭파운동 (똥배/복부지방)", "아랫뱃살 #똥배 #뱃살 Instagram으로 오시면 더 다양한 운동 동작들을 만나보실 수 있습니다!", "ko", 24, "2020-09-07 10:00:25", 7562, 178864, 11213099),
(0, "8UNMmdc0Lzw", "소미핏 SOMIFIT", "허벅지 안쪽살 제거! 내전근 강화운동 (2주만 해보세요! 효과 미쳤어요!)", "운동 #홈트 #미서원 #somifit #다이어트 #안벅지 #허벅지안쪽살빼기 안녕하세요! 여러분 미서원 입니다. 오늘운동 안벅지살 빼는 운동 ...", "ko", 24, "2019-09-30 11:16:21", 9387, 229381, 11054013),
(0, "xpzMr3nSOIE", "코치미스쿨Coach ME School", "[한글 자막] X-HIT 마일리 사이러스 다리 운동", "유투브 600만 HIT 마일리 사이러스 다리 운동 영상에 한국어 자막을 입힌 영상입니다^^", "ko", 24, "2015-03-12 07:18:36", 17002, 97714, 11036916),
(0, "qaBIL8NMCMo", "Thankyou BUBU", "무.조.건! 살빠지는 댄스 다이어트", "안녕하세요, Thankyou BUBU 입니다. 다이어트는 무조건 어렵고 고되어야만 하는걸까요? 저희도 처음에는 그렇게 생각했습니다.", "ko", 24, "2018-01-23 09:56:02", 11073, 115852, 10737578),
(0, "9WhpAVOSyl8", "Thankyou BUBU", "하루 딱6분! 다리라인 살리는 운동 [허벅지&amp;엉덩이]", "안녕하세요, 땅끄부부 입니다! 2016년 11월3일 블로그에 '스쿼트 런지 플랭크 30일 챌린지' 포스팅을 한 적이 있습니다. 사실 집에서 ...", "ko", 24, "2017-11-06 12:21:20", 34752, 103943, 10652373),
(0, "NDsjmxTROEo", "Thankyou BUBU", "하체비만 11자다리 최고의 운동 [하체 핵매운맛]", "이번 영상은 저희의 이런 단순한 생각으로 만들어졌습니다. '핵매운맛st 불타는 하체 다리토닝 운동을 만들어보자' '스쿼트나 런지없이 ...", "ko", 24, "2020-08-02 09:51:50", 14444, 169281, 10415582),
(0, "TDrJXYqN-e0", "동네놈들", "🇺🇲🇮🇩🇯🇵SUB] [몰카] 헬스장에서 약빨은 회원이 눈 앞에서 운동을 한다면?!!!! - [동네놈들]", "장소 협찬 : 터닝포인트짐 청라점 구독 & 좋아요 & 알림설정 Click?!?! oh yeah!!!! 동네놈들 페이스북   ...", "ko", 24, "2019-06-27 10:30:01", 5295, 111332, 10280125),
(0, "PjGcOP-TQPE", "Thankyou BUBU", "11자복근 복부 최고의 운동 [복근 핵매운맛]", "이번 영상을 찍기 전 저희가 했던 생각은 단순하고도 명확했습니다. '이번에는 정말 최고의 복근&복부운동 영상을 찍어보자.", "ko", 24, "2020-07-19 09:04:16", 12808, 111747, 10163006),
(0, "zcQ16cfJN9Q", "Thankyou BUBU", "9분! 초간단 누워서하는 11자 복근운동", "안녕하세요, Thankyou BUBU 입니다. 2015년 5월26일 '하루10분 복근만들기' 영상을 올린지도 벌써 2년하고도 6개월이 지났습니다.", "ko", 24, "2017-11-01 02:05:59", 19297, 119657, 10096341),
(0, "8KrcRZIqtUQ", "운동 음악[Workout Music]", "운동할때 듣기좋은 노래모음 🌟 최고의 운동 음악 믹스 2018 🌟 운동동기부여 - 하드 운동에 음악", "운동할때 듣기좋은 노래모음 최고의 운동 음악 믹스 2018 운동동기부여 - 하드 운동에 음악 https://youtu.be/8KrcRZIqtUQ ...", "ko", 24, "2019-01-14 22:08:22", 1584, 0, 10070523),
(0, "h4AgUgjxL6s", "BANGTANTV", "[VLOG] 정국 | 근육토끼의 운동일지 #오늘도_나는_근육을_키운다 #단발머리그소년", "[VLOG] 정국 | 근육토끼의 운동일지 촬영: JK, 트레이너1 자막: JK #오늘도_나는_근육을_키운다 #단발머리그소년 BTS Official ...", "ko", 24, "2019-10-11 12:00:06", 40465, 1156432, 9933768),
(0, "54tTYO-vU2E", "Thankyou BUBU", "상체 다이어트 최고의 운동 BEST [팔뚝살/겨드랑이살/등살/가슴어깨라인]", "꼭 읽어주세요!   팔뚝살, 겨드랑이살, 등살등 상체운동은 꼭 반팔, 민소매를 입는 계절에만 하는 것이 아닙니다. '몸은 거짓말을 하지 ...", "ko", 24, "2019-11-10 08:50:45", 8469, 136813, 9939564),
(0, "6deIIWXs5ro", "제이제이살롱드핏", "하복부 운동 제대로 하는 꿀팁! 아랫뱃살 빼는 운동은 이렇게해야돼요.! (레그레이즈 허리통증잡기)", "안녕하세요~ 젤린이 여러분! 오늘은 고민부위 중 아랫배 운동을 들고왔어요. 아랫배는 무조건 운동을 한다고해서 해결되는 부위가 ...", "ko", 24, "2019-01-21 09:35:20", 2051, 107804, 9824435),
(0, "t70t-sklypk", "Thankyou BUBU", "집에서 칼로리 불태우는 걷기 유산소운동 [칼소폭 순한맛]", "벌써 '칼로리 소모 폭탄 [칼소폭]'이라는 이름으로 통합 전신운동 루틴을 올린지도 어느덧 2년이 지났고(시간 참 빠르네요...) 칼소폭1, 2 ...", "ko", 24, "2019-12-29 09:13:40", 8029, 90174, 8925822),
(0, "CTojmKLkWTo", "Thankyou BUBU", "전신 다이어트 최고의 운동 [칼소폭 핵매운맛]", "안녕하세요, Thankyou BUBU 입니다! 사실 칼소폭(칼로리 소모 폭탄 운동) 시리즈는 당시 예전 홈트 영상들에서는 거의 찾아보기 ...", "ko", 24, "2020-06-29 09:12:31", 13378, 94199, 8756477),
(0, "CkRDw4En_78", "Thankyou BUBU", "단시간 전신 다이어트 최고의 운동 [칼소폭 찐 핵매운맛]", "이번 영상은 한마디로 정말 맵습니다☠ 기존 '칼소폭 핵매운맛'이 '와~ 맵다' 정도였다면, 이번 '칼소폭 찐 핵매운맛'은 온 몸이 얼얼하게 ...", "ko", 24, "2020-09-14 10:30:35", 14430, 98340, 8756842),
(0, "h7cZIEcqB10", "이지은 다이어트 Jiny diet", "♦️두꺼운 배둘레햄♦️ 에서 탈출! 잘록허리 만들기!", "홈트레이닝 : 잘록허리 만들기 / 일반식이 편안해지는 '3주 식사훈련' 보러가기 Class101 https://class101.net/products/Iup4Qwe.", "ko", 24, "2020-05-28 11:24:12", 7829, 231362, 8617301),
(0, "9SuuJZaAJeA", "헬창TV Korea Fitness HellchangTV", "30년차 보디빌더가 본 200만 유튜버 운동 실력 | 피지컬갤러리(빡빡이아저씨)", "헬창TV #피지컬갤러리 #헬창 헬창TV 션 인스타그램 https://www.instagram.com/hellchang/ ...", "ko", 24, "2019-12-05 09:00:00", 2874, 35124, 8463997),
(0, "MMswNnLdHso", "Thankyou BUBU", "단기간 살빠지는 최고의 운동 [칼소폭2]", "많은 분들이 '칼로리 소모 많은 운동'을 말할 때 단순히 런닝머신에서 빠른 속도로 뛰는 운동 또는 심장이 두근거려 심박수가 높아지는 ...", "ko", 24, "2019-01-01 11:28:11", 14607, 92238, 8339370),
(0, "ZSlp52IDzu0", "엄마TV", "댄스 다이어트 끝판왕 체중감량 운동 다이어트 댄스 에어로빅", "안녕하세요. 이번 엄마티비에서는 회원님들의 관절 부담없이 스트레스를 날려버리며 진행할 수 있는 에어로빅 다이어트 영상을 제작 ...", "ko", 24, "2018-09-11 07:40:30", 6115, 74922, 8155841),
(0, "eg_DipJ7UVk", "Thankyou BUBU", "뱃살 빠지는 최고의 운동 BEST", "2018년 1월 1일 업로딩한 '무.조.건! 뱃살 빠지는 운동 BEST5'... 실제로 저희가 뱃살을 뺄 때 가장 많이 도움되었던 동작들을 루틴으로 ...", "ko", 24, "2019-10-20 08:51:26", 7101, 108223, 8075769),
(0, "xPdJIxBZM54", "비타민신지니 VitaminJINY", "🔥찰싹붙은 허벅지 안쪽살 챌린지🔥빨리 빼고 싶으시다면 2주만 해보세요.(안벅지 제거/허벅지살)", "허벅지안쪽살 #안벅지제거운동 #내전근강화운동 Instagram으로 오시면 더 다양한 운동 동작들을 만나보실 수 있습니다!", "ko", 24, "2020-07-21 09:30:08", 9035, 274840, 7969703),
(0, "sdkHMA8I0Pc", "피카토 Phycato", "굽은 등, 굽은 어깨 초간단 교정운동! 1분만 투자해보세요/라운드숄더 교정운동", "대부분 굽은 등 어깨를 펼 때, 날개뼈를 뒤로 접으라고 합니다. 하지만..이러한 동작이 오히려 굽은 등 어깨를 가속화 한다는 사실.", "ko", 24, "2020-02-28 09:22:12", 24231, 154713, 7938792),
(0, "C3TqpGgnIoI", "Thankyou BUBU", "상체 다이어트 운동 BEST [팔뚝살/겨드랑이살/가슴어깨/등살]", "안녕하세요, 땅끄와 오드리입니다. 오늘은 집에서도 쉽게 앉아서도 할 수 있는 맨몸 상체운동 루틴을 준비해 보았습니다. 사실 지금 ...", "ko", 24, "2017-11-13 13:58:02", 3008, 138781, 7919494),
(0, "oQT4QMc0jwY", "뽀로로(Pororo)", "[뽀로로 4기] 14화 운동을 잘 하고 싶어요", "뽀로로의 새로운 영상을 가장 빠르게 만나는 방법! 지금 바로 뽀롱뽀롱 뽀로로 공식 유튜브 채널 [구독]버튼을 눌러주세요. ☆뽀로로 ...", "ko", 24, "2016-05-24 10:17:17", 9252, 93284, 7839434),
(0, "PoYzxj8Iy5M", "Thankyou BUBU", "2주만에 복근 만드는 운동 2 MIN ABS WORKOUT", "'복근 만드는 초간단 운동' 설명서   - 복근의 여러 부위(상복근/하복근/외복사근)를 다각도로 자극하는 루틴입니다. - 하루 2번 이상 ...", "ko", 24, "2019-10-13 09:01:54", 7458, 16556, 7665134),
(0, "3VouSaW_LPw", "Thankyou BUBU", "전신 다이어트 유산소운동 [홈트레이닝]", "안녕하세요, 땅끄와 오드리 입니다! 연휴동안 쉬면서 몸에 지방이 필요이상으로 많이 붙어버린듯 합니다. 집에서도 쉽게 할 수 있는 ...", "ko", 24, "2017-10-13 04:09:22", 7466, 88929, 7439823),
(0, "cl5cc1_5zZc", "여리나핏", "층간 소음 걱정 없이 체중 감량 보장! 딱 5분 운동!", "안녕하세요 여러분~! 새해 복 많이 받으세용!! 새해를 맞아 #5분운동 이 돌아왔습니다! 오래 기다리셨죠?!ㅠㅠㅠ 새로운 마음으로 ...", "ko", 24, "2019-01-03 09:55:25", 8873, 73543, 7112856),
(0, "EDq180TqRIc", "Thankyou BUBU", "허벅지 종아리 최고의 운동 BEST", "2017년 12월 11일 업로딩한 '다리 얇아지는 최고의 운동 BEST5' 영상... 다행히 많은 분들이 함께해주시고 좋아해주셔서 채널내 ...", "ko", 24, "2019-10-27 09:00:59", 4723, 93657, 7053190),
(0, "4vEIEHZtu84", "팀일루션 노성율 - TEAM1LLUSION", "전세계 1%만 가능한 하체운동⁉️😱 Webster Pistol Squat Challenge", "온라인으로 텀블링 배우기 https://101.gg/team1llusion-class HDEX 10% 할인쿠폰: 1llusion 처음부터 잘 하는 사람은 없습니다.", "ko", 24, "2023-02-11 11:00:04", 1127, 963017, 27013902),
(0, "dpBYYEhdofI", "이지은 다이어트 Jiny diet", "앞벅지 볼록, 뒷벅지 셀룰라이트, 허벅지 안쪽살 모조리 불태우고🔥 [여리탄탄 일자 허벅지] 되는 7일 루틴", "허벅지 돌려깎기 / 이지은 다이어트가 입고 있는 '부종ZERO 순환레깅스' 구경하기 [https://www.mwooyang.com/leggins/?idx=13] ...", "ko", 24, "2021-06-21 07:55:52", 22252, 408024, 17723205),
(0, "gMaB-fG4u4g", "Thankyou BUBU", "전신 다이어트 최고의 운동 [칼소폭 찐 핵핵매운맛]", "이번 영상은 정말! 정말! 맵습니다     사실 운동 영상을 준비할 때 강도를 높이는 것은 그리 어려운 작업이 아닙니다. (스쿼트, 런지 ...", "ko", 24, "2021-05-24 09:07:17", 13698, 148757, 13187970),
(0, "SUPk5FFha5I", "DN.Beauty Natural", "TOP SLIM LEG WORKOUT FOR GIRL | Get Slim Legs, Slim Thighs, Slim Calves, Skinny Legs (FAST &amp; EASY)", "The best exercise for slim and slender legs fast. Reduce big legs, big calves, and stretch legs to make them slender and beautiful.", "ko", 24, "2022-04-16 13:00:11", 8061, 410961, 11012462),
(0, "VavX0QxW-9g", "운동하는제이 장은실", "김강민선수와 레슬링 덤벨운동 #shorts", "", "ko", 24, "2022-10-24 06:17:01", 2678, 58556, 8632720),
(0, "0L5gAT1fJaM", "Thankyou BUBU", "뱃살 아랫뱃살 최고의 운동", "'뱃살, 영상 하나로 끝내고 싶다!' 오늘 영상을 만들기 위해 저희 부부가 가졌던 생각입니다. 많은 뱃살 복부 관련 운동들이 있지만 '정말 ...", "ko", 24, "2021-05-31 10:01:16", 5535, 124603, 8536006),
(0, "N2l-S9e-tzQ", "ootb STUDIO", "용인대 체대생 vs 아이돌 누가 더 운동 잘함?", "공감과 정보와 추억을 모두 담은 캠퍼스 문화 부흥 프로젝트 매일 전과하는 남자 [전과자] 매주 목요일 오후 6시 #ootbSTUDIO ...", "ko", 24, "2023-01-16 10:09:39", 754, 155116, 6092437),
(0, "UscTQBjERO4", "지피티", "잘생겼으면 운동 금지", "shorts * 비즈니스 문의 E-mail : tjrdbs999@naver.com *미트리 (지피티 회원가입시 추천인 코드 : 100371050) (56%할인) ...", "ko", 24, "2022-08-15 05:06:51", 2066, 105972, 5804266),
(0, "BGlWzp0f17E", "헬창TV Korea Fitness HellchangTV", "여자 운동 종목별 몸매 특징", "헬창 #여자운동 #헬창tv 헬창TV 션 인스타그램 https://www.instagram.com/hellchang/ ...", "ko", 24, "2022-06-09 07:15:06", 5425, 76864, 5713163),
(0, "MRaAcIQOIIw", "엠뚜루마뚜루 : MBC 공식 종합 채널", "[전참시] 힘지민 ㄹㅇ AI 아닌가요? 잘 먹고 운동도 웃으면서 중량침,,🤔 에스파(aespa) 쉬는 날 일상💖ㅣ#에스파 #카리나 MBC220709방송", "[전지적 참견 시점] 토요일 밤 11시 10분 방송! MBC의 따끈따끈한 영상을 내 맘대로 편하게 즐기는 채널   엠뚜루마뚜루 보러 ...", "ko", 24, "2022-07-12 08:22:47", 3712, 68771, 5455685),
(0, "z-9_9EZAYKg", "시금치맨 운동상식", "5달 동안 똑같이 먹고 운동했는데 결과는.. ㅠㅠ", "shorts #근성장 #운동.", "ko", 24, "2023-02-11 03:36:40", 1814, 53369, 5327219),
(0, "fYwrh1-jtbg", "덕질분석가 덕분", "이 피규어 때문에 서명운동까지 터짐ㅋㅋㅋ", "덕분 #웹툰 #애니 The following music was used for this media project: Music: Disco Club by WinnieTheMoog Free download: ...", "ko", 24, "2023-02-13 10:15:29", 1796, 84191, 5120561),
(0, "ocRzxJXuTIE", "잠백이", "무산소 운동인데 자꾸 숨을 쉬래", "잠백이 #Shorts.", "ko", 24, "2022-05-27 16:17:04", 1108, 127966, 4948580),
(0, "0iqP6WP2ET4", "MIZI", "뱃살빼기! 효과보장!! 15MIN STANDING ABS WORKOUT - No Talking , No Equipment", "뱃살이 쭉쭉 빠지는 효과만점 15분 운동!!   MIZI Instagram https://www.instagram.com/_______mizi/ Music by UNBLOOM x Disco ...", "ko", 24, "2021-04-26 09:00:01", 388, 37911, 4901468),
(0, "1iqzlhL95cI", "재호 - Fitness", "복근 운동 7분 안에 끝내기 (2주 안에 식스팩 만들기!) | 6 PACK ABS WORKOUT (Make a six-pack in 2 weeks!)", "안녕하세요 트레이너이자 물리치료사 노재호입니다. 선명한 식스팩 복근을 만들기 위한 초중급자용 루틴입니다. 40초 운동 20초 휴식 ...", "ko", 24, "2022-06-09 11:05:58", 1005, 64992, 4842632),
(0, "myNjmnvI6x0", "빅씨스 Bigsis", "NO 층간소음 올인원 운동 - 40분 유산소운동 홈트 - 관절에 무리없이 체지방 태우기", "NO 층간소음 NO 스쿼트 - 40분 유산소운동 홈트 - 관절에 무리없이 체지방 태우기] - 땀 많이 나고 숨이 많이 차는 올인원 운동입니다.", "ko", 24, "2021-01-22 11:39:03", 1289, 128734, 4824927),
(0, "V4IiZhzymOA", "뻔더 FUNDAMENTAL", "복근 운동 전 이거 하나만 꼭 알고 하세요", "instagram : frogman137 문의 : sky9411241@naver.com.", "ko", 24, "2022-10-24 01:00:11", 3131, 73060, 4721687),
(0, "o6vQqZCRYtA", "추언니 연구소", "이 3가지 운동을 습관처럼하면 늙지 않아요!", "shorts =============================== - 페이스북 https://bit.ly/3u0aItn - 인스타그램 https://bit.ly/3gv9Usq ...", "ko", 24, "2022-11-12 10:45:01", 2167, 86526, 4597928),
(0, "FgexHtSADow", "KBS 생로병사의 비밀", "84세 남성에게 새로운 인생을 살게해준 플랭크 운동 - 집에서 운동하시나요? (KBS_768회_20210317)", "84세 김영달씨에게 새로운 인생을 살게해준 플랭크 운동 - 집에서 운동하시나요? (KBS_768회_20210317) #생로병사의비밀 #운동 ...", "ko", 24, "2021-03-18 03:00:05", 177, 47669, 4554359),
(0, "u5sgxhwqep4", "보통사람을 위한 운동채널", "여자들이 좋아하는 반팔 vs 극혐하는 반팔", "팔근육 x2배 키우는 더 자세한 운동방법은? [풀영상] :https://youtu.be/4vSP9HK3EN0?t=89 '보통사람'이 바로 따라할 수 있는 ...", "ko", 24, "2023-04-22 03:00:31", 1276, 33435, 4471934),
(0, "JsF2nzetLBU", "비타민신지니 VitaminJINY", "👑조회수 ‘8,000,000’ 찍은👑전설의 팔뚝살빼는운동 7분 리뉴얼 버전", "팔뚝살빼는운동 #팔뚝살완전제거운동 #tonedarmsworkout ...", "ko", 24, "2021-04-12 10:00:14", 719, 46787, 4415988),
(0, "qFLuUFM2x9A", "KBS 생로병사의 비밀", "하루 4km 걷기 운동의 기적! 올바른 걷기 운동 (KBS_20210602 방송)", "[하루 4km 걷기, 건강 일사천리!] 남녀노소 누구나 쉽게 실천할 수 있는 운동, 걷기. 걷기 운동은 우리 건강에 어떤 도움을 주는 것일까?", "ko", 24, "2021-06-20 08:00:11", 3931, 57729, 4397363),
(0, "Rp397m7Dqo0", "인간미 넘치는 건강멘토", "뱃살, 내장지방 이 동작으로 벽 짚고하면 싹 다 빠집니다! 걷기 대신 이 운동을 매일 하세요! 운동 효과 최고입니다!  [뱃살빼는운동, 올챙이배빼는운동, 내장지방빼는운동,복부비만]", "중년남성, 여성분들이 뱃살도 빼고 관절에도 무리가 안 가면서 하체 근육을 만들 수 있도록 짧은 시간 안에 효율적인 운동을 하기 ...", "ko", 24, "2023-03-30 08:00:18", 1465, 32841, 4337712),
(0, "u_9untoVK7w", "MIZI", "일주일만에 뱃살 빼기🔥30분 서서하는 복근 운동 - 스쿼트X 런지X 점핑X", "새로운 30분 뱃살빼기 운동   여러분들의 최애 서서하는 복부 운동을 준비했어요 쉬는 시간 없이 논스탑으로 쭉~ 30분 달리는 영상 ...", "ko", 24, "2022-12-14 08:00:31", 889, 84818, 4286442),
(0, "1_x2qJsddf4", "1분대장", "운동 유튜버가 운동하기 싫을 때", "shorts 당신의 1분을 재밌게 만들어줄게요.", "ko", 24, "2023-05-01 02:00:01", 666, 73845, 4279028),
(0, "jpTQdM7okkI", "사호 노트", "티파니 10분 옆구리,허리 운동", "", "ko", 24, "2014-10-27 17:06:43", 12521, 122018, 17762567),
(0, "axzymV8VtRI", "JASON MEDIA", "운동 첫 날 부터 스테로이드 꽂고 시작하는 남자 와 ㄷㄷ", "https://www.tiktok.com/@john_joshua_james 구독과✓ 좋아요는 큰 힘이 됩니다   재미있는 걸 보내주세요!", "ko", 24, "2023-05-06 11:20:14", 562, 43414, 4186014),
(0, "nJo8ewDprPc", "MIZI", "🔥일주일만에 뱃살 실종🔥 서서하는 복근 운동 50분!!", "안녕하세요 여러분!! 올 여름, 뱃살 옆구리살과 작별 인사할 준비 되셨나요? 집에서 도구없이 따라할수있는 서서하는 복근 운동 50분 ...", "ko", 24, "2022-05-18 08:09:00", 995, 41524, 3874337),
(0, "24k7fsKLUB4", "김종국 GYM JONG KOOK", "호랑이 굴에 들어가도 운동만 하면 산다...", "광수와 함께 한 두번째 영상 입니다! 간단히 끝내려고 시작 했는데 또 길어졌습니다..ㅎ 아쉬웠지만 그래도 광수에게 조금이라도 도움 ...", "ko", 24, "2022-04-07 09:00:15", 810, 58899, 3797120),
(0, "I4Q5Q0AIm8c", "팀일루션 노성율 - TEAM1LLUSION", "하체운동 하는법 ⭕️ Human Squat Challenge", "온라인으로 텀블링 배우기 https://101.gg/team1llusion-class 처음부터 잘 하는 사람은 없습니다. 유연성이 안 좋아서, 근력이 약해서, ...", "ko", 24, "2022-11-27 11:00:09", 2367, 70855, 3775490),
(0, "KZdQdzcrMOg", "MIZI", "일주일만에 팔뚝살 폭파🔥 일자 팔뚝 만들기 8분 운동", "안녕하세요 여러분!! 오늘은 여름대비 팔뚝살 제거 운동 영상을 가지고 왔어요! 여름이 되면 제일 먼저 신경쓰이는 부위가 바로 팔뚝 ...", "ko", 24, "2022-05-09 07:18:11", 637, 68619, 3710542),
(0, "zFplI6ajyKU", "MIZI", "2주만에 허리살 옆구리살 박살내기!! 서서하는 운동 40분 - 개미허리 만들기", "안녕하세요 여러분!! 이번 영상은 허리살 옆구리살을 쉽게 뺄수있는 저강도 서서하는 운동 40분 프로그램이에요!! 2주동안 매일매일 ...", "ko", 24, "2022-01-25 03:22:42", 806, 65918, 3667927),
(0, "2bWqz7eFd9U", "내 몸의 호르몬 밸런스", "골다공증 환자의 인생을 바꾼 &#39;이 운동&#39; 꼭 하세요!", "연골이 다 닳아서 걷기엔 무릎이 아프신 분들! 이런 운동이 좋습니다!! 또 골다공증 환자가 피해야 할 운동에는 어떤 운동이 있는지 영상 ...", "ko", 24, "2022-01-05 11:00:01", 446, 57591, 3502371),
(0, "zrtE1k-V18U", "헬마드 (헬스 건강 정보)", "어깨 넓어지는 운동 방법 찾고 계셨나요?", "풀업, 턱걸이, 푸쉬업, 벤치프레스... 무슨 운동을 해야 어깨가 넓어질 수 있을까요? . 랭킹닭컴 X 헬마드 https://bit.ly/3LMibEm ...", "ko", 24, "2022-05-03 09:15:01", 573, 63546, 3471808),
(0, "03vWaIXnm7c", "[이밍TV] iming TV", "다이어트할때 하는 모든 운동들 l 여자 헬스장 루틴(종목,세트수,쉬는시간)", "안녕하세요 :) 오늘 영상에서는 제가 다이어트를 할 때와 평소에도 하고 있는 운동들을 소개하려고 합니다. 오늘도 영상 즐겁게 시청해 ...", "ko", 24, "2022-06-09 12:00:00", 1050, 98536, 3437026),
(0, "aGupgiNudo4", "파뿌리", "24시간동안 유산소 운동 VS 무산소 운동!! 다이어트 효과가 더 좋은 건?!", "노랭이 PD : 둘 다 고생했다 ※ 강호이 : 김황중이 했어야 했는데.. ※ 진렬이 : 나 체력 왜 이러냐... #파뿌리24 파뿌리 채널 구독하기 ...", "ko", 24, "2021-11-28 09:00:00", 2432, 22248, 3408878),
(0, "Ol33D4wmPDQ", "JASON MEDIA", "여신 만나려고 운동했다가 괴물이 되어버린 남자 ㄷㄷ", "틱톡에서 생긴 희대의 감동적인 인연 ㄷㄷ @theleanbeefpatty @SkiMaskDuets 구독과✓ 좋아요는 큰 힘이 됩니다   재미있는 걸 ...", "ko", 24, "2023-02-09 03:17:52", 2376, 87705, 3378474),
(0, "a_GjJjUx0pg", "일반인클라쓰 RONIE", "운동하는 남자를 만나면 밤에 후회하는 이유ㅋㅋ", "Follow Bahij Kaddoura's IG : https://www.instagram.com/bahijkaddoura/ [미트리] 닭가슴살, 소고기, 다이어트 식품 최대 할인가로 ...", "ko", 24, "2023-05-01 04:05:08", 983, 77537, 3344518),
(0, "oR12qnBKYNI", "흑자헬스 SurplusHealth", "95kg이면 무슨 운동부터 해야할까?", "", "ko", 24, "2022-11-14 03:32:30", 2847, 73051, 3255922),
(0, "_SvvieLcBBs", "김종국 GYM JONG KOOK", "얘들아 운동 재미’있지’…? (Feat. ITZY)", "가수 선배로서 후배들에게 해줄수 있는게.. 보컬 트래이닝 이면 너무 뻔하잖아요 ㅋ 오래 오래 건강히 활동 할수 있도록 앞으로도 최선 ...", "ko", 24, "2022-07-21 09:02:55", 2995, 76385, 3248437),
(0, "SAF0F6quKzI", "닥터홍선생 (OS Dr.Hong)", "[닥터홍선생]#22.어깨통증! 회전근개 파열! 한가지 운동으로 끝! + 오십견과 구별하는 법", "어깨가 아프신가요? 회전근개 파열인지, 오십견인지 구별하기 어려우신가요? 집에서 어깨 운동 하고 싶은데 어떤 운동을 해야 할지 ...", "ko", 24, "2021-07-21 00:55:24", 1949, 45666, 3224418),
(0, "LK9e6mg4cmQ", "Thankyou BUBU", "허벅지살 다리살 최고의 운동", "이 영상은 '모두가 함께 할 수 있는 누워서도 가능한 동작들이지만, 스쿼트만큼 하체 허벅지에 불타는 자극을 주는 루틴'을 목표로 ...", "ko", 24, "2021-06-08 10:04:37", 4158, 46855, 3215677),
(0, "orpoYsCXlKA", "이지은 다이어트 Jiny diet", "전소미, 모모의 복근을 만들어준 바로 그 운동! (일주일만 함께해요🔥)", "다이어트는 단순히 살을 빼는 것이 아니라 건강한 습관을 길들이는 과정입니다. 인스타그램 jiny_kilogram #전소미#모모#복근.", "ko", 24, "2021-12-03 12:52:08", 1858, 94051, 3196311),
(0, "vUnEtNHkDlg", "당뇨병의 정석", "당뇨병 이기려면 꼭 해야되는 이 운동!! 하루 10분만 투자하세요~! | 대한당뇨병학회", "당뇨병에 관련하여 궁금하신 내용은 댓글로 질문남겨주세요. 다음 영상에 내 질문이 나올지도 몰라요!! 좋아요!! 구독!! 댓글!", "ko", 24, "2021-07-05 01:00:09", 335, 46409, 3193279),
(0, "1-kHEJcYp1w", "헬마드 (헬스 건강 정보)", "팔 근육이 빠르게 두꺼워지는 놀라운 운동 방법", "두꺼운 팔 근육.. 헬스로 쉽게 만들 수 있습니다. 어떤 팔운동을 해야 크고 강한 삼두근과 이두근을 가질 수 있을지 알아봅시다. 랭킹 ...", "ko", 24, "2022-04-27 10:30:01", 493, 78203, 3066319),
(0, "6Nysp0sCR88", "보통사람을 위한 운동채널", "과학적으로 팔뚝(전완근) 가장 빠르게 키워주는 운동 1위는!?", "아래는 효과적으로 전완근 사이즈를 키우는데 도움이 되는 용품정보 입니다. 참고가 되시길 바라겠습니다!^^ 5:25 * 굵고 쫙쫙 ...", "ko", 24, "2022-07-02 03:00:04", 667, 43648, 3052981),
(0, "5MACh6ylf8g", "핏블리 FITVELY", "운동할때 들으려고 모은 &#39;레전드&#39; 운동노래 모음🎵 [Playlist]", "Play list] 0:00 C'est La Vie (Explicit Version) - Siine 2:50 Better Came Along - Siine 5:45 I Need More of You - Hallman 9:00 ...", "ko", 24, "2021-09-28 10:00:05", 563, 19913, 3011237),
(0, "kETh8T3it4k", "힙으뜸", "(층간소음X, 설명O) 복근운동과 유산소를 한번에❗️서서하는 복근운동 1탄🔥", "심으뜸복근운동 #코어운동 #통증없는복근운동.", "ko", 24, "2021-08-30 10:15:01", 671, 53453, 3001814),
(0, "YZic9wEnqVg", "KBS 생로병사의 비밀", "무릎아픈 3인, 3주간 근육운동 결과는? (KBS 20211103 방송)", "퇴행성 관절염 등 각종 이유로 무릎 통증에 시달리는 3인. 3주간의 근육운동 실험 결과는? 2021년 11월 3일 방송된 [당신의 두 다리가 ...", "ko", 24, "2021-11-11 09:30:10", 2108, 48783, 2809742),
(0, "8rX2UfWCtfA", "김종국 GYM JONG KOOK", "토크는 고 반복, 운동은 저 반복… (Feat. 유재석, 지석진)", "짐종국에 왔는데 그냥은 못보내잖아요? ㅎ 오랫동안 재석이형을 봐오면서 딱 저 정도 운동을 즐기시는 분들이 효율적으로 도움이 될수 ...", "ko", 24, "2022-09-22 09:12:33", 499, 34463, 2765785),
(0, "W1Xh7el-ayg", "건강한남편-누구나 할수 있는 쉬운 운동", "무릎 관절에 무리 없는 걷기 말고 이 운동, 무조건 꼭 하세요 | 한달 뒤 엉덩이 하체 근육에 놀라운 변화가 생깁니다. 스쿼트 대신 체력 기르는 운동", "운동 바로 시작 : 00:02:57 중년이 될수록 뱃살은 점점 늘어나는데, 하체는 점점 가늘어져서 걱정이신가요? 관절에 무리 없는 운동을 ...", "ko", 24, "2023-01-28 20:26:40", 339, 40352, 2759069);

SELECT * FROM `video`;

-- -----------------------------------------------------
-- Table `ssafit_db`.`board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafit_db`.`board` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `writer_no` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `context` VARCHAR(45) NULL,
  `reg_date` TIMESTAMP NULL DEFAULT NOW(),
  `view_cnt` INT NULL DEFAULT 0,
  PRIMARY KEY (`no`),
  INDEX `no_idx` (`writer_no` ASC) VISIBLE,
  CONSTRAINT `board_writer_no`
    FOREIGN KEY (`writer_no`)
    REFERENCES `ssafit_db`.`user` (`no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `board` VALUES
(0, 1, "관리자 테스트", "관리자용 테스트 게시글입니다.", NOW(), 0),
(0, 2, "디헤입니당~", "디헤 가입했습니당~~", NOW(), 0),
(0, 3, "오운완", "오늘 목표 달성해서 조기퇴근합니다!", NOW(), 0),
(0, 4, "사이트 너무 잘 만드셨네요!", "개발자가 누군지 정말 대단합니다^^!", NOW(), 0),
(0, 2, "다이어트는 내일부터", "내일부터 진짜로 운동할거예요!", NOW(), 0);

SELECT * FROM `board`;

-- -----------------------------------------------------
-- Table `ssafit_db`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafit_db`.`message` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `context` VARCHAR(1000) NULL,
  `user_from` INT NOT NULL,
  `user_to` INT NOT NULL,
  `send_date` TIMESTAMP NULL DEFAULT NOW(),
  `checked` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`no`),
  INDEX `no_idx` (`user_from` ASC) VISIBLE,
  INDEX `to_no_idx` (`user_to` ASC) VISIBLE,
  CONSTRAINT `from_no`
    FOREIGN KEY (`user_from`)
    REFERENCES `ssafit_db`.`user` (`no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `to_no`
    FOREIGN KEY (`user_to`)
    REFERENCES `ssafit_db`.`user` (`no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `message` VALUES
(0, "메세지 테스트", "테스트용 메세지입니다.", 2, 3, NOW(), 0),
(0, "메세지 테스트", "테스트용 메세지입니다.", 3, 2, NOW(), 0);

INSERT INTO `message` VALUES
(0, "혜민님 오운완 하셨나요?", "오늘부터 운동 하신다고 약속한거 안잊으셨죠??", 2, 3, NOW(), 0),
(0, "그럼요!", "진작에 아운완 했습니다~~~", 3, 2, NOW(), 0),
(0, "혜민님 안녕하세요!", "반가워요~~~~", 4, 3, NOW(), 0),
(0, "지혜야 안녕?", "반갑구나^^", 4, 2, NOW(), 0),
(0, "당신을 버터짐으로 초대합니다.", "혜민아 같이 버터짐 다니자!", 5, 3, NOW(), 0),
(0, "한번 더 생각했나요?", "그럼 두번 더 생각하세요.", 7, 3, NOW(), 0),
(0, "거절합니다", "저는 숨쉬기 운동으로 충분해요^^", 3, 5, NOW(), 0),
(0, "같이 운동해요", "진짜로 오늘부터 운동할거예요!", 2, 10, NOW(), 0),
(0, "버터짐 회원권 삽니다@@@", "네고 해주세요", 3, 8, NOW(), 0),
(0, "반가워요", "같이 열심히 운동합시다!", 9, 2, NOW(), 0),
(0, "거절합니다.", "플미 붙여서 사실거면 연락주세요.", 8, 3, NOW(), 0),
(0, "예지야 아운완했다며?", "너 진짜 대단하다...", 3, 10, NOW(), 0);

SELECT * FROM `message`;

-- -----------------------------------------------------
-- Table `ssafit_db`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafit_db`.`review` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `video_no` INT NOT NULL,
  `writer_no` INT NOT NULL,
  `context` VARCHAR(1000) NOT NULL,
  `reg_date` TIMESTAMP NULL DEFAULT NOW(),
  `modified` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`no`),
  INDEX `no_idx` (`writer_no` ASC) VISIBLE,
  INDEX `no_idx1` (`video_no` ASC) VISIBLE,
  CONSTRAINT `review_writer_no`
    FOREIGN KEY (`writer_no`)
    REFERENCES `ssafit_db`.`user` (`no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `review_video_no`
    FOREIGN KEY (`video_no`)
    REFERENCES `ssafit_db`.`video` (`no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `review` VALUES
(0, 1, 1, "리뷰 테스트", NOW(), 0),
(0, 2, 1, "리뷰 테스트", NOW(), 0),
(0, 3, 1, "리뷰 테스트", NOW(), 0),
(0, 4, 1, "리뷰 테스트", NOW(), 0),
(0, 1, 2, "배가 불타는거같아여..........", NOW(), 0),
(0, 1, 4, "복근운동 굿", NOW(), 0),
(0, 1, 7, "운동 할 시간에 공부나 해라", NOW(), 0),
(0, 1, 9, "북마크해두고 다음에 해야지", NOW(), 0),
(0, 1, 6, "이 영상을 추천합니다 ^^~", NOW(), 0),
(0, 2, 5, "우왕 내가 리뷰 1빠다!", NOW(), 0),
(0, 2, 8, "나는 2빠", NOW(), 0),
(0, 2, 10, "위에 둘 다 탈퇴해주세요^^", NOW(), 0),
(0, 1, 3, "운동이 참 재미있네요 ^^", NOW(), 0);

SELECT * FROM `review`;

-- -----------------------------------------------------
-- Table `ssafit_db`.`follow`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafit_db`.`follow` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `followee` INT NOT NULL,
  `follower` INT NOT NULL,
  `follow_date` TIMESTAMP NULL DEFAULT NOW(),
  PRIMARY KEY (`no`),
  INDEX `no_idx` (`followee` ASC) VISIBLE,
  INDEX `follower_no_idx` (`follower` ASC) VISIBLE,
  CONSTRAINT `followee_no`
    FOREIGN KEY (`followee`)
    REFERENCES `ssafit_db`.`user` (`no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `follower_no`
    FOREIGN KEY (`follower`)
    REFERENCES `ssafit_db`.`user` (`no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `follow` VALUES
(0, 3, 2, NOW()),
(0, 4, 2, NOW()),
(0, 2, 3, NOW()),
(0, 4, 3, NOW()),
(0, 2, 7, NOW()),
(0, 2, 9, NOW()),
(0, 7, 2, NOW()),
(0, 5, 2, NOW()),
(0, 3, 6, NOW()),
(0, 3, 8, NOW()),
(0, 10, 3, NOW()),
(0, 9, 3, NOW()),
(0, 3, 1, NOW());


SELECT * FROM `follow`;

-- -----------------------------------------------------
-- Table `ssafit_db`.`like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafit_db`.`like` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `user_no` INT NOT NULL,
  `video_no` INT NOT NULL,
  `like_date` TIMESTAMP NULL DEFAULT NOW(),
  PRIMARY KEY (`no`),
  INDEX `no_idx` (`user_no` ASC) VISIBLE,
  INDEX `no_idx1` (`video_no` ASC) VISIBLE,
  CONSTRAINT `like_user_no`
    FOREIGN KEY (`user_no`)
    REFERENCES `ssafit_db`.`user` (`no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `like_video_no`
    FOREIGN KEY (`video_no`)
    REFERENCES `ssafit_db`.`video` (`no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `like` VALUES
(0, 2, 1, NOW()),
(0, 2, 2, NOW()),
(0, 2, 5, NOW()),
(0, 2, 8, NOW()),
(0, 2, 9, NOW()),
(0, 2, 14, NOW()),
(0, 2, 16, NOW()),
(0, 2, 20, NOW()),
(0, 2, 24, NOW()),
(0, 3, 1, NOW()),
(0, 3, 3, NOW()),
(0, 3, 4, NOW()),
(0, 3, 6, NOW()),
(0, 3, 29, NOW()),
(0, 3, 8, NOW()),
(0, 3, 39, NOW());

SELECT * FROM `like`;

-- -----------------------------------------------------
-- Table `ssafit_db`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafit_db`.`playlist` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `user_no` INT NULL,
  `video_no` INT NULL,
  PRIMARY KEY (`no`),
  INDEX `no_idx` (`user_no` ASC) VISIBLE,
  INDEX `no_idx1` (`video_no` ASC) VISIBLE,
  CONSTRAINT `playlist_user_no`
    FOREIGN KEY (`user_no`)
    REFERENCES `ssafit_db`.`user` (`no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `playlist_video_no`
    FOREIGN KEY (`video_no`)
    REFERENCES `ssafit_db`.`video` (`no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
