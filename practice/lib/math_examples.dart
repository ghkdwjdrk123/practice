import 'dart:io';
import 'dart:math';


/**
 * 내용적으로 개선점
 * 1. 실패 확률 적용하기. -> 수정 중 -> 15, 20에 실패시에는 강등 X
 * 2. 파괴 확률 적용하기. -> 수정 중
 * + 연속 실패의 경우 실패 횟수 체크해주기.
 * + 다시 성공하면 초기화
 * + 전체 파괴 횟수 체크해주기.
 * 2.5 2번 연속 강등 시 보너스 타임 추가. (찬스 타임!)
 * 3. 소모되는 메소 계산해서 알려주기.
 * 5. 중간에 그만둘 수 있도록 만들기.
 * 6. 다 된다면 마지막에는 처음에 가지고 있는 메소 입력 받고 해당 메소에서 강화비용 소모하기.
 * + 자동화 돌려서 스타포스 시뮬레이터로 만들기
 *
 * 프로그래밍 관점에서의 개선점
 * 1. 중복 코드 줄이기.
 * + 성공 확률, 파괴 확률 등을 뽑아오는 함수를 따로 만들면 더 최적화 가능하겠다. + 스타포스 관련 이벤트도 쉽게 적용 가능.
 * 2. 자동 강화 코드 만들기.
 */

int minusCnt = 0;

void main() {
  int starForceLevel = 0;

  while(true) {
    starForceLevel = starForceStrengthen(starForceLevel);

    if(minusCnt == 2) {
      print('찬스 타임! 강화 시도시 무조건 1번 성공합니다.');
    }

    if(starForceLevel == 25) {
      print('25성을 달성하여 더이상 강화할 수 없습니다. 축하드립니다!!!!');
      break;
    }
  }
}

int starForceStrengthen(int level) {
  stdout.write('현재 스타포스 레벨은 $level 입니다.\n강화하려면 1을 입력해주세요. ');
  String? input = stdin.readLineSync();
  stdout.write('\n');
  String inputNullSafety = input??'';

  int result;

  int yesno = int.parse(inputNullSafety);

  if(yesno == 1) {
    result = strengthen(level);
  }
  else result = level;

  print('현재 스타포스 수치는 $result 입니다.\n==========================');

  return result;
}

int strengthen(int level) {
  Random rand = Random();
  // 소수를 쓰지 않기 위해 *100 해서 사용
  int randomNumber = rand.nextInt(10000);

  // 성공 확률 관련 -> 소수를 쓰지 않기 위해 *100 해서 사용
  int zeroToTwo = 9500;
  int threeToFourteen = 10000;
  int fifteenTwentyOneSuc = 3000;
  int TwentyTwoSuc = 300;
  int TwentyThreeSuc = 200;
  int TwentyFourSuc = 100;

  // 파괴 확률
  int fifteenSeventeenDest = 210;
  int eightteenNinteenDest = 280;
  int twentyTwentyOneDest = 700;
  int TwentyTwoDest = 1940;
  int TwentyThreeDest = 2940;
  int TwentyFourDest = 3960;

  // 파괴 체크 flag
  int destFlg = 0;

  if(minusCnt == 2) {
    level++;
    print('강화에 성공하였습니다!');

    minusCnt = 0;
  }else if(0 <= level && level < 3) {
    if (randomNumber < zeroToTwo - level * 500) {
      level++;
      print('강화에 성공하였습니다!');

      minusCnt = 0;
    }else {
      print('강화 실패...');
    }
  }else if(3 <= level && level < 15) {
    if (randomNumber < threeToFourteen - level * 500) {
      level++;
      print('강화에 성공하였습니다!');

      minusCnt = 0;
    }else {
      print('강화 실패...');
    }
  }else if(15 <= level && level < 22){
    if (randomNumber < fifteenTwentyOneSuc) {
      level++;
      print('강화에 성공하였습니다!');

      minusCnt = 0;
    }else {
      if (15 <= level && level < 18 && destFlg == 0){
        if (fifteenTwentyOneSuc <= randomNumber &&
            randomNumber < fifteenTwentyOneSuc + fifteenSeventeenDest) {
          level = 12;
          print('아이템이 파괴되었습니다. 스타포스 12성으로 돌아갑니다...');

          destFlg = 1;
        }
      }else if (18 <= level && level < 20 && destFlg == 0){
        if (fifteenTwentyOneSuc <= randomNumber &&
            randomNumber < fifteenTwentyOneSuc + eightteenNinteenDest) {
          level = 12;
          print('아이템이 파괴되었습니다. 스타포스 12성으로 돌아갑니다...');

          destFlg = 1;
        }
      }else if (20 <= level && level < 22 && destFlg == 0){
        if (fifteenTwentyOneSuc <= randomNumber &&
            randomNumber < fifteenTwentyOneSuc + twentyTwentyOneDest) {
          level = 12;
          print('아이템이 파괴되었습니다. 스타포스 12성으로 돌아갑니다...');

          destFlg = 1;
        }
      }
      if (destFlg == 0 && (level != 15 || level != 20)) {
        level--;
        print('강화 실패... 강화 단계가 1단계 떨어집니다.');
        minusCnt++;
      }else if (destFlg == 0) {
        print('강화 실패...');
      }
    }
  }else if(level == 22) {
    if (randomNumber < TwentyTwoSuc) {
      level++;
      print('강화에 성공하였습니다!');

      minusCnt = 0;
    }else {
      if (TwentyTwoSuc <= randomNumber && randomNumber < TwentyTwoSuc + TwentyTwoDest && destFlg == 0) {
        level = 12;
        print('아이템이 파괴되었습니다. 스타포스 12성으로 돌아갑니다...');
      }
      if (destFlg == 0) {
        level--;
        print('강화 실패... 강화 단계가 1단계 떨어집니다.');
        minusCnt++;
      }
    }
  }else if(level == 23) {
    if (randomNumber < TwentyThreeSuc) {
      level++;
      print('강화에 성공하였습니다!');

      minusCnt = 0;
    }else {
      if (TwentyThreeSuc <= randomNumber && randomNumber < TwentyThreeSuc + TwentyThreeDest) {
        level = 12;
        print('아이템이 파괴되었습니다. 스타포스 12성으로 돌아갑니다...');
      }
      if (destFlg == 0) {
        level--;
        print('강화 실패... 강화 단계가 1단계 떨어집니다.');
        minusCnt++;
      }
    }
  }else if(level == 24) {
    if (randomNumber < TwentyFourSuc) {
      level++;
      print('강화에 성공하였습니다!');

      minusCnt = 0;
    }else {
      if (TwentyFourSuc <= randomNumber && randomNumber < TwentyFourSuc + TwentyFourDest) {
        level = 12;
        print('아이템이 파괴되었습니다. 스타포스 12성으로 돌아갑니다...');
      }
      if (destFlg == 0) {
        level--;
        print('강화 실패... 강화 단계가 1단계 떨어집니다.');
        minusCnt++;
      }
    }
  }

  // 파괴 flag 초기화 -> 필요 없다.
  // destFlg = 0;

  return level;
}