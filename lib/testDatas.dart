// 漫画类别
class ComicKind{
  static int nums = 20;
  static const warmBloody = '热血';
  static const romantic = '恋爱';
  static const campus = '校园';
  static const lesbian = '百合';
  static const rainbow = '彩虹';
  static const adventure = '冒险';
  static const seraglio = '后宫';
  static const sci_fi = '科幻';
  static const war = '战争';
  static const suspence = '悬疑';
  static const infer = '推理';
  static const funny = '搞笑';
  static const fantastic = '奇幻';
  static const terror = '恐怖';
  static const god_ghost = '神鬼';
  static const history = '历史';
  static const coterie = '同人';
  static const sports = '运动';
  static const decent = '绅士';
  static const mech = '机甲';

  static List<String> allKinds(){
    return [ComicKind.adventure, ComicKind.campus, ComicKind.coterie, ComicKind.decent, ComicKind.fantastic, 
            ComicKind.funny, ComicKind.god_ghost, ComicKind.history, ComicKind.infer, ComicKind.lesbian,
            ComicKind.mech, ComicKind.rainbow, ComicKind.romantic, ComicKind.sci_fi, ComicKind.seraglio,
            ComicKind.sports, ComicKind.suspence, ComicKind.terror, ComicKind.war, ComicKind.warmBloody];
  }
}

// for debug 漫画测试数据
const Map Datas = {
  'number': 12,
  'comics': {
    '古惑仔': {
      'title': '古惑仔系列20龙头之争',
      'author': '牛佬',
      'brief': '陈浩南的起起跌跌。',
      'summary': '一个古惑仔由四九（社团最底层成员）三年内升为红棍的故事。',
      'status': '连载中',
      'kind': [ComicKind.warmBloody],
      'imgW': 'images/w/古惑仔系列20龙头之争.jpg',
      'imgH': 'images/h/古惑仔.jpg'
    },
    '海贼王': {
      'title': '海贼王',
      'author': '尾田荣一郎',
      'brief': '围绕着“大秘宝”而展开的海洋冒险故事现在开启！',
      'summary': '相传22年前，在一个童话般的世界里，曾经拥有一切的海贼王在走上断头台的时候对人们狂笑道：“想要我的财宝是吗，想要就给你们！去找吧，全世界的宝藏都在那里！”……自此开始，全世界勇敢的男人都离开了平庸的生活，走向了大海，向着埋藏海贼王宝藏的伟大航道挺进！世界简直成为了大海贼时代！ 在某个村子的小孩莫奇。D.路飞对“海贼王”甚为仰慕，立志要成为新一代的海贼王。因此他希望驻扎在村子的海盗团能带他出海，可...',
      'status': '连载中',
      'kind': [ComicKind.warmBloody, ComicKind.adventure],
      'imgW': 'images/w/海贼王.jpg'
    },
    '全世界都不如你': {
      'title': '全世界都不如你',
      'author': '掌阅漫画',
      'brief':  '什么？又是替嫁老套路…才不呢！',
      'summary': '替嫁归替嫁，别人家的替嫁新娘可都是暗恋新郎多年的，咱家元月月：不暗恋，明逃婚，还给男主带点绿，嘻嘻~ 只是万万没想到逃婚“外遇”对象居然还是“老公”本人，衰啊！可是“老公”好像还不知道我是替嫁的，而且他身后还有一群莺莺燕燕，该怎么办呢?',
      'status': '连载中',
      'kind': [ComicKind.romantic, ComicKind.campus],
      'imgH': 'images/h/全世界都不如你.jpg'
    },
    '惹上首席总裁': {
      'title': '惹上首席总裁',
      'author': '有鹿文化',
      'brief': '一场见义勇为，挑衅首席总裁!',
      'summary': '本是一场因见义勇为而招惹了这个男人，本是处于劣势的童天爱居然在偷溜之前，写下了挑衅的“战书”。可是她不知道那个男人竟然是秦晋阳——秦氏财团总裁…他发誓要将这个逃跑的女人找出来！第二天，各大媒体版块同时刊登头条通缉令！她看着手机，一张脸充血红了个彻底。',
      'status': '连载中',
      'kind': [ComicKind.romantic],
      'imgH': 'images/h/惹上首席总裁.jpg'
    },
    '山海逆战': {
      'title': '山海逆战',
      'author': '邱福龙',
      'brief': '山海之间无奇不有，更有各种珍奇异兽存活其间。',
      'summary': '智者伯益发现食用异兽之肉，饮其鲜血，便能获得异兽之力。而这些身负奇能者，被称为异士！伯益走遍天下，笔录所见的异兽，并写成《山海经》，更是以此创立的山海派，宣扬食用异兽获得异能的理念。但是当伯益消失之后，山海派却逐渐地失去了往日的理念，成为了追名逐利的集团。。少年勾徹是山海派的奴隶，却拥有惊人的异能。一次与异兽的战斗，彻底改变了少年和整个世界的命运…',
      'status': '连载中',
      'kind': [ComicKind.warmBloody, ComicKind.god_ghost],
      'imgH': 'images/h/山海逆战.jpg'
    },
    '少女与战车': {
      'title': '少女与战车',
      'author': '槌居×鈴木貴昭',
      'brief': '这是一个将使用战车的武技“战车道”与花道、茶道这些并称为大和抚子的做法的世界。',
      'summary': '西住美穗转学到了县立大洗女子学园。因为讨厌战车道，才转学到没有战车道的大洗女子学园的美穗，没想到才刚刚转学过来就被学生会长叫了过去，会长要求美穗选择战车道的修行并且还要在全国大会中出场。而且，队伍中聚集的成员全部都是超个性派——花道本家的大小姐五十铃华、热衷于恋爱的武部沙织、对战车无比狂热的秋山优花里、早上起不来的优等生...',
      'status': '已完结',
      'kind': [ComicKind.fantastic],
      'imgH': 'images/h/少女与战车.jpg'
    },
    '万古剑神': {
      'title': '万古剑神',
      'author': '不辣鸡骑士团',
      'brief': '剑客。',
      'summary': '天下最风流的剑客，名曰沈三公子\n天下最有名的剑法，唤作万藏剑经\n天下最强大最神秘的地方，是为弃剑山庄',
      'status': '连载中',
      'kind': [ComicKind.warmBloody, ComicKind.adventure, ComicKind.fantastic],
      'imgH': 'images/h/万古剑神.jpg'
    },
    '王爷不能撩': {
      'title': '王爷不能撩',
      'author': '轻漫文化',
      'brief': '又怂又浪的逗比女汉子VS高冷精分腹黑王爷!',
      'summary': '醒来躺在棺材里就算了，居然还变成了‘男’人！林涵跪地痛哭，穿越的日子不好过啊！',
      'status': '连载中',
      'kind': [ComicKind.romantic, ComicKind.funny],
      'imgH': 'images/h/王爷不能撩.jpg'
    },
    '五等分的花嫁': {
      'title': '五等分的花嫁',
      'author': '春场ねぎ',
      'brief': '谁说女主角只能有一个的？',
      'summary': '初次见面的女主角们！\n大家都各有千秋可爱非常！',
      'status': '连载中',
      'kind': [ComicKind.romantic, ComicKind.campus, ComicKind.seraglio],
      'imgH': 'images/h/五等分的花嫁.jpg'
    },
    '妖神记': {
      'title': '妖神记',
      'author': '踏雪动漫',
      'brief': '妖神一出，谁与争锋？',
      'summary': '这是一个妖灵的世界，融合了妖灵，就可以成为强大的妖灵师。 因为一本时空妖灵之书，时空发生了扭转，当一切重新开始之时，命运之轮缓缓转动。',
      'status': '连载中',
      'kind': [ComicKind.warmBloody, ComicKind.fantastic, ComicKind.adventure],
      'imgH': 'images/h/妖神记.jpg'
    },
    '元尊': {
      'title': '元尊',
      'author': 'Dr.大吉',
      'brief': '少年执笔，龙蛇舞动；劈开乱世，点亮苍穹。',
      'summary': '气掌乾坤的世界里，究竟是蟒雀吞龙，还是圣龙崛起？！',
      'status': '连载中',
      'kind': [ComicKind.warmBloody, ComicKind.fantastic, ComicKind.adventure],
      'imgH': 'images/h/元尊.jpg'
    },
    '约定的梦幻岛': {
      'title': '约定的梦幻岛',
      'author': '白井カイウ  出水ぽすか',
      'brief': '可怕。',
      'summary': '妈妈说外面的世界好可怕，我不信； 但是那一天、我深深地体会到了妈妈说的是真的！ 因为不仅外面的世界、就连妈妈也好可怕……',
      'status': '连载中',
      'kind': [ComicKind.adventure, ComicKind.sci_fi, ComicKind.suspence],
      'imgH': 'images/h/约定的梦幻岛.jpg'
    }
  }
};

// for debug 推荐Banner所需测试数据
List<Map> forBanners = [
  {'column': '#倾情选荐\n', 'comic': Datas['comics']['海贼王']},
  {'column': '#读者最爱\n', 'comic': Datas['comics']['古惑仔']}
];

// for debug TOP推荐列表所需测试数据
List<Map> forRankList = [
  {'title': '热血', 'comic': Datas['comics']['古惑仔']},
  {'title': '恋爱', 'comic': Datas['comics']['五等分的花嫁']},
  {'title': '校园', 'comic': Datas['comics']['少女与战车']},
  {'title': '奇幻', 'comic': Datas['comics']['妖神记']},
  {'title': '科幻', 'comic': Datas['comics']['约定的梦幻岛']},
];

// for debug 书架所需测试数据
int lastReading = 1;
List<Map> forShelf = [
  Datas['comics']['山海逆战'],
  Datas['comics']['元尊'],
  Datas['comics']['万古剑神']
];

// for debug 搜索页所需测试数据
List<Map> forSearch = [
  Datas['comics']['海贼王'],
  Datas['comics']['古惑仔']
];

// for debug 动态页所需测试数据
List<Map> forRecord = [
  {'content': '向书架添加了《山海逆战》。', 'time': '3秒 前'},
  {'content': '浏览了《元尊》的详情。', 'time': '4分钟 前'},
  {'content': '通过 微信支付 充值了100漫币！', 'time': '5小时 前'},
  {'content': '开启了在漫漫的漫画探索之旅!!!', 'time': '6天 前'}
];