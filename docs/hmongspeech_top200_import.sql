-- HmongSpeech 前200条导入脚本
USE zhijin_miao;

-- 确保导入使用的发音人存在
INSERT INTO speakers (speaker_id, name, age, gender, dialect_background, phonetic_quality)
SELECT 'HS1', 'HmongSpeech导入', 30, 'M', 'HmongSpeech', '良好'
WHERE NOT EXISTS (SELECT 1 FROM speakers WHERE speaker_id = 'HS1');

-- 导入词条
INSERT INTO vocabulary (word_id, word_text, pinyin, tone, category) VALUES
('HM0001', '这些花好看极了', 'dol bangx nongd vut hxid lins niox', NULL, 'hmong_import'),
('HM0002', '到外面劈一点材来烧', 'mongl gux pab nenk dul lol diod', NULL, 'hmong_import'),
('HM0003', '给他帽子戴头上', 'baib nenx laib mos det diot khob', NULL, 'hmong_import'),
('HM0004', '他的一颗牙断了', 'nenx ib det hmid lod yangx', NULL, 'hmong_import'),
('HM0005', '去摘一个瓜来煮', 'mongl liuk laib fab lol hot', NULL, 'hmong_import'),
('HM0006', '这根绳子要搓长一点', 'jox hlat nongd nongk hfab dad nenf', NULL, 'hmong_import'),
('HM0007', '这个锅是个铁锅', 'laib wil nongd dios laib wil hlet', NULL, 'hmong_import'),
('HM0008', '这棵树的枝桠多的很', 'dail det nongd not ghab jil bongt wat', NULL, 'hmong_import'),
('HM0009', '将这个酒坛移进去', 'yax laib tok jud nongd mongl niangs', NULL, 'hmong_import'),
('HM0010', '他被蛇咬了', 'nenx yins dail nangb gif yangx', NULL, 'hmong_import'),
('HM0011', '太阳出来了', 'hnaib dax yangx', NULL, 'hmong_import'),
('HM0012', '这只狗不咬人', 'dail dlad nongd ax gik naix', NULL, 'hmong_import'),
('HM0013', '初十六月亮才最圆', 'hnaib juf diut hlat jef hsat dlenx', NULL, 'hmong_import'),
('HM0014', '这个小孩的脚真的嫩', 'dail jib daib nongd jil lob jus deix vab', NULL, 'hmong_import'),
('HM0015', '这些房子全是木房', 'dol zaid nongd sail dios zaid det', NULL, 'hmong_import'),
('HM0016', '拿这根鞭子去赶牛', 'dad diangb ceib nongd mongl dias ninx', NULL, 'hmong_import'),
('HM0017', '她在水沟边洗衣服', 'nenx niangb ghab but gif eb sad ud', NULL, 'hmong_import'),
('HM0018', '不要用这些锄头去挖石头', 'ax gid dad dol hsod nongd mongl juk vib', NULL, 'hmong_import'),
('HM0019', '这个外国人的牙齿最白', 'dail waid gof renf nongd had hmid hsat dlub', NULL, 'hmong_import'),
('HM0020', '茄子煮汤也好吃', 'zend jax hot zas seix vut nongx', NULL, 'hmong_import'),
('HM0021', '拿这只篮子去装菜', 'dad jil kent nongd mongl jis vob', NULL, 'hmong_import'),
('HM0022', '这两只老虎是朋友', 'ob dail xed nongd dios ghab bul', NULL, 'hmong_import'),
('HM0023', '这个水车是木制的', 'laib hxab eb nongd dios det tid', NULL, 'hmong_import'),
('HM0024', '一只撮箕装灰 , 一只撮箕装土', 'ib jil yas jis hxud , ib jil yas jis dab', NULL, 'hmong_import'),
('HM0025', '这是一只绿头公鸭', 'dail bad gas nongd dios dail nox khob', NULL, 'hmong_import'),
('HM0026', '一斤肉要多少钱', 'ib jangb ngix ed not xus seix', NULL, 'hmong_import'),
('HM0027', '这颗菜生虫了', 'dius vob nongd xangf gangb yangx', NULL, 'hmong_import'),
('HM0028', '将这把刀磨快一点', 'dad diangb diuk nongd hved hvit nenf', NULL, 'hmong_import'),
('HM0029', '这只公鸡的毛是白的', 'dail bad gheib nongd dios dail dlub dlinb', NULL, 'hmong_import'),
('HM0030', '一条裤子有两条裤腿', 'ib laib khet maix ob jil diongx', NULL, 'hmong_import'),
('HM0031', '这双鞋是捆鞋带的', 'niuf hab nongd dios niuf kheib hlat', NULL, 'hmong_import'),
('HM0032', '这两只牛角也最好看', 'ob jil gib ninx nongd seix hsat vut hxid', NULL, 'hmong_import'),
('HM0033', '你拿这个壶去装酒', 'mongx dad laib heb nongd mongl jis jud', NULL, 'hmong_import'),
('HM0034', '这种药一天吃两次', 'diel jab nongd ib hnaib hek ob lind', NULL, 'hmong_import'),
('HM0035', '这个帽子是圆帽', 'laib mos nongd dios laib mos dlenx', NULL, 'hmong_import'),
('HM0036', '把你的衣服穿上才不冷', 'dad mongx pangb ud nangl diot jef ax seil', NULL, 'hmong_import'),
('HM0037', '你也乘这辆车去', 'mongx seix bus laib ceeb nongd mongl', NULL, 'hmong_import'),
('HM0038', '拿这块砧板来切菜', 'dad liul khaib nongd lol hvub vob', NULL, 'hmong_import'),
('HM0039', '拿一张报纸给我看', 'dad ib langl baod zix baib wil ngangt', NULL, 'hmong_import'),
('HM0040', '一只猴子有两只眼睛', 'ib dail leib maix ob jil hniub mais', NULL, 'hmong_import'),
('HM0041', '把这张纸贴在门上', 'dad dleif dud nongd niab diot ghab diux', NULL, 'hmong_import'),
('HM0042', '一只螃蟹有八只脚', 'ib dail diob maix yaf jil lob', NULL, 'hmong_import'),
('HM0043', '拿扫帚来扫地', 'dad diangb dieb lol qib dab', NULL, 'hmong_import'),
('HM0044', '用筷子夹菜才快', 'dad dius gheik vob jef hvit', NULL, 'hmong_import'),
('HM0045', '开会时不要说话', 'kaib huid hxot id ax gid hmat hseid', NULL, 'hmong_import'),
('HM0046', '他有一位叔叔是华侨', 'nenx maix ib laix bad yut dios huaf qiaof', NULL, 'hmong_import'),
('HM0047', '拿你的手表来看一下', 'dad mongx laib sux biaox lol hxid ib mais', NULL, 'hmong_import'),
('HM0048', '这是德国的国旗', 'langl qif nongd dios dieef guof bangf', NULL, 'hmong_import'),
('HM0049', '他是一个共青团员', 'nenx dios ib laix gongd qinb tuaif wif', NULL, 'hmong_import'),
('HM0050', '他的这些棉花确实白', 'nenx dol hsenb nongd jus deix dlub', NULL, 'hmong_import'),
('HM0051', '他的叔叔在昆明', 'nenx bangf bad yut niangb kunb minf', NULL, 'hmong_import'),
('HM0052', '这只凳子也有四只脚', 'diangb dangk nongd seix maix dlob jil lob', NULL, 'hmong_import'),
('HM0053', '这些是猪骨头', 'dol nongd dol bod hsongd bat', NULL, 'hmong_import'),
('HM0054', '船在水中漂来漂去', 'diangb niangx niangb diub eb lal mongl lal lol', NULL, 'hmong_import'),
('HM0055', '这只野鸡也在等他的伙伴', 'dail niongx nongd seix dangl nenx ghab bul', NULL, 'hmong_import'),
('HM0056', '广东怎么走才到', 'guangx dongb ait deis mongl jef leit', NULL, 'hmong_import'),
('HM0057', '我是苗族', 'wil dios dail hmub', NULL, 'hmong_import'),
('HM0058', '一碗饭吃不饱', 'ib dit gad nongx ax xangd', NULL, 'hmong_import'),
('HM0059', '我家住在凯里', 'wil zaid niangb diot kad linx', NULL, 'hmong_import'),
('HM0060', '他满十八岁了', 'nenx baid juf yaf hniut yangx', NULL, 'hmong_import'),
('HM0061', '走快点 , 才能赶到车', 'hangb hvit nenf , dias jef gol ceeb', NULL, 'hmong_import'),
('HM0062', '今天真的太热了', 'hnaib nongs jus deix kaib bongt wat', NULL, 'hmong_import'),
('HM0063', '快点来我们商量', 'dax hvit nenk bib xit xiangs', NULL, 'hmong_import'),
('HM0064', '吃好饭就去看书', 'nongx gad jangx ghax mongl hxid dud', NULL, 'hmong_import'),
('HM0065', '他刚过去了', 'nenx hangd qud fat dax mongl yangx', NULL, 'hmong_import'),
('HM0066', '走路去还是乘车去', 'hangb gid mongl ghaid bus ceeb mongl', NULL, 'hmong_import'),
('HM0067', '去打一点酒来喝', 'mongl dib nenk jud lol hek', NULL, 'hmong_import'),
('HM0068', '他什么时候来', 'nenx hxot deis dax', NULL, 'hmong_import'),
('HM0069', '我们俩一起走', 'ob laix xit seix mongl', NULL, 'hmong_import'),
('HM0070', '我去买件新衣服过年', 'wil mongl mail pangb ud hvib nongx niangx', NULL, 'hmong_import'),
('HM0071', '今天我们去种树', 'hnaib nongd bib dax mongl jenl det', NULL, 'hmong_import'),
('HM0072', '弟弟种了一株桃树', 'wil zaid dail yut jenl ib dail det zend dlenx', NULL, 'hmong_import'),
('HM0073', '我种了一株梨树', 'wil jenl ib dail det zend viax', NULL, 'hmong_import'),
('HM0074', '树上有三只鸟', 'dail det gid waix niangb bib dail nes', NULL, 'hmong_import'),
('HM0075', '牛在山上吃草', 'dail ninx niangb diub bok nongx nangx', NULL, 'hmong_import'),
('HM0076', '哥哥放牛去了', 'dail bed xangt ninx mongl yangx', NULL, 'hmong_import'),
('HM0077', '我不吃猪肉', 'wil ax nongx ngix bat', NULL, 'hmong_import'),
('HM0078', '这头猪肥得很', 'ib dail bat nongd diangs lins niox', NULL, 'hmong_import'),
('HM0079', '碗和筷子都有了', 'dit sul dius sail niangb yangx', NULL, 'hmong_import'),
('HM0080', '这座山很高', 'laib bok nongd hvib lins niox', NULL, 'hmong_import'),
('HM0081', '我喉咙疼得很', 'wil bangf laib ghab ghongd nongd mongb lins niox', NULL, 'hmong_import'),
('HM0082', '猎人上山打猎去了', 'dail naix dias ngax dax mongl ghab vud dias ngax mongl yangx', NULL, 'hmong_import'),
('HM0083', '医生来我家给我看病', 'ib dail xangs jab lol wil zaid nas wil hxid bind', NULL, 'hmong_import'),
('HM0084', '孩子们上学去了', 'dol ghab dail dax mongl duf leix mongl yangx', NULL, 'hmong_import'),
('HM0085', '姑娘们正在村边唱歌', 'dol daib pik xangf nongd niangb dit ghab but vangl gol hxak', NULL, 'hmong_import'),
('HM0086', '亲戚朋友们都来吃酒', 'dol ghab but xut khat bax linf lol hek jud', NULL, 'hmong_import'),
('HM0087', '这些人都是生产能手', 'dol naix nongd bax linf dis dol naix ait gheb hsat vut', NULL, 'hmong_import'),
('HM0088', '我家养有一群鸭子', 'wil zaid yis niangb ib mail gias', NULL, 'hmong_import'),
('HM0089', '这些树又高又大', 'ib kub det nongd hvib bongt wat , hlieb bongf wat', NULL, 'hmong_import'),
('HM0090', '屋子里面有人说话', 'diub zaid gid niangs maix naix hmat hveb', NULL, 'hmong_import'),
('HM0091', '桌子上有一本书', 'jox dax gid waix maix ib benx dud', NULL, 'hmong_import'),
('HM0092', '你的鞋在床底下', 'mongx bangf hab niangb dit ghab sangx qut gid dab', NULL, 'hmong_import'),
('HM0093', '房子前面有一条河', 'ghab diux dangl hfud niangb jox eb', NULL, 'hmong_import'),
('HM0094', '房子当中放着一张方桌', 'gid zaid ghab diongb niangb jox dax dlob gib', NULL, 'hmong_import'),
('HM0095', '他坐在路旁休息', 'nenx niangb dit jox gid ghab but qet ves', NULL, 'hmong_import'),
('HM0096', '我住在他家的对面', 'wil niangb dit nenx zaid hvangb bil', NULL, 'hmong_import'),
('HM0097', '老人在房子外面晒太阳', 'dail naix lul niangb dit nenx zaid ghab but diux dat hnaib', NULL, 'hmong_import'),
('HM0098', '东边的山比西边的高', 'haib dax bangf laib bok bix haib mongl bangf laib box hvib', NULL, 'hmong_import'),
('HM0099', '里面的衣服短 , 外面的衣服长', 'gid niangs bangf pangb ud laid , gid gux bangf pangb ub dad', NULL, 'hmong_import'),
('HM0100', '上面那两块土地种包谷', 'gid waix ob diod las jenl giad diel', NULL, 'hmong_import'),
('HM0101', '下面这三块种黄豆', 'gid dab bib diod jenl def bud', NULL, 'hmong_import'),
('HM0102', '明天四月初八', 'fal sot dios hlat dlob jit hlat hnaib yaf', NULL, 'hmong_import'),
('HM0103', '这几天很冷', 'ob bib hnaib nongd seil lins niox', NULL, 'hmong_import'),
('HM0104', '今天晚上我去找你', 'hmangt nongd wil dax mongl vangs mongx', NULL, 'hmong_import'),
('HM0105', '什么时候饿了什么时候吃', 'hxod deis xit xus yangx ghax hxod deis nongx', NULL, 'hmong_import'),
('HM0106', '将来的生活还要更好', 'xuk hnaib khangd nongx khangd nangl vel ait vel vut', NULL, 'hmong_import'),
('HM0107', '我现在去', 'wil zas nongd gax mongl', NULL, 'hmong_import'),
('HM0108', '早上他都在地里干活', 'hxib dat nenx sail niangb dit diub las ait gheb', NULL, 'hmong_import'),
('HM0109', '我等了半天你都不来', 'wil dangl ib dangl hnaib mongx seix ax dax', NULL, 'hmong_import'),
('HM0110', '今年的稻子比去年的好', 'hniut nongd bangf laib nax bix hniut aib bangf vut', NULL, 'hmong_import'),
('HM0111', '王哥哥的锯子好得很', 'bed wangf bangf diangb jik vut wat', NULL, 'hmong_import'),
('HM0112', '书记的儿子回来生产了', 'sub jid bangf dail daib diangd lol ait gheb yangx', NULL, 'hmong_import'),
('HM0113', '河里的鱼比海里的鱼好吃', 'jox eb bangf laib nail bix diub haix bangf laib rail vut nongx', NULL, 'hmong_import'),
('HM0114', '本地姜不辣', 'nongf fangb bangf laib kid ax naf', NULL, 'hmong_import'),
('HM0115', '五岁的孩子爱放鞭炮', 'zab hniut ghab daib hlib bangd pot', NULL, 'hmong_import'),
('HM0116', '我是工人 , 你是农民 , 他是学生', 'wil dis gongb renf , mongx dis naix ait gheb , nenx dis naix qeb leix', NULL, 'hmong_import'),
('HM0117', '他们也来了', 'nenx dol seix dax yangx', NULL, 'hmong_import'),
('HM0118', '今天我们去砍柴', 'haib nongd bib dax mongl hxib dul', NULL, 'hmong_import'),
('HM0119', '我们三个都住在那边的村子里', 'bib bib laix niangb pit aib jus laib vangl', NULL, 'hmong_import'),
('HM0120', '自己做自己吃', 'nongf ait nongf nongx', NULL, 'hmong_import'),
('HM0121', '我自己都不知道', 'nongf wil dub ax bub', NULL, 'hmong_import'),
('HM0122', '这是你自己说出来的', 'laib nongd dis mongx nongf hot dax', NULL, 'hmong_import'),
('HM0123', '你不要告诉别人', 'mongx ax gid xangs naix jub', NULL, 'hmong_import'),
('HM0124', '大家都来了', 'dangx dol dub lol yangx', NULL, 'hmong_import'),
('HM0125', '这是什么花', 'laib nongd dis laib bangx gheix xit', NULL, 'hmong_import'),
('HM0126', '我父亲是他舅舅', 'wil bad dis nenx zaid daib nenl', NULL, 'hmong_import'),
('HM0127', '我弟弟今年十一岁了', 'wil zaid dail yut hniut nongd dot juf ghaid hniut yangx', NULL, 'hmong_import'),
('HM0128', '你的茶在桌子上', 'mongx bangf eb jenl niangb dit jox dax', NULL, 'hmong_import'),
('HM0129', '我的拳头比你的大', 'wil bangf laib bod liul bix mongx bangf hlieb', NULL, 'hmong_import'),
('HM0130', '这件衣服是他的', 'pangb ud nongd dis nenx bangf', NULL, 'hmong_import'),
('HM0131', '这孩子有十二三岁了', 'dail ghab daib nongd ait vangx dot juf ob bib hniut yangx', NULL, 'hmong_import'),
('HM0132', '今年的收成比去年的多一倍', 'hniut nongd hxub bangx bix hniut aib not hxangt ib dangl', NULL, 'hmong_import'),
('HM0133', '个个都说家乡好', 'laix laix seix hot nongf fangb vut', NULL, 'hmong_import'),
('HM0134', '今年我回了一趟家', 'hniut nongd wil mongl leit zaid ib dias', NULL, 'hmong_import'),
('HM0135', '我两年前见过他一次', 'wil ob hniut denx bongf nenx ib dias', NULL, 'hmong_import'),
('HM0136', '他被狗咬了一口', 'nenx yens dail dlad gik ob had', NULL, 'hmong_import'),
('HM0137', '你想想看', 'mongx zot nos ngit', NULL, 'hmong_import'),
('HM0138', '人们来来往往地像赶场一样', 'dol naix mongl mongl lol lol liek hvad xangx jus diel', NULL, 'hmong_import'),
('HM0139', '你到门外去看看', 'mongx mongl ghab diux ngit', NULL, 'hmong_import'),
('HM0140', '把衣服脱下来洗洗', 'tad ud lol hsot', NULL, 'hmong_import'),
('HM0141', '小孩不要乱砍门槛', 'dol ghab daib ax gid muf maf ghab but diux', NULL, 'hmong_import'),
('HM0142', '他大摇大摆地走过去', 'nenx deif lob deif bil hangb dax mongl', NULL, 'hmong_import'),
('HM0143', '青蛙一蹦一蹦地跳', 'dail ghangd dik ib diod ib died', NULL, 'hmong_import'),
('HM0144', '他哭啼啼地说不出话来', 'nenx genx hens hens hmat ax lol hveb yel', NULL, 'hmong_import'),
('HM0145', '一手抢过来抱得紧紧的', 'ib jil bil luf dot lol ghax bes jongt jongt', NULL, 'hmong_import'),
('HM0146', '学生把皮球一下子扔过去', 'dol ghab daib dad laib pif quf gox mongl', NULL, 'hmong_import'),
('HM0147', '坐着不要乱动', 'niangb dad ax gid hab ves', NULL, 'hmong_import'),
('HM0148', '凶手突然拔出刀来', 'dail naix yangf vil diuk diux dax yangx', NULL, 'hmong_import'),
('HM0149', '人们拥挤得水泄不通', 'dol naix xit lid xit enk gok tinb', NULL, 'hmong_import'),
('HM0150', '我们正在商量这个问题', 'bib jef hangd qend lol xit xangs hfud gid nongd', NULL, 'hmong_import'),
('HM0151', '当我到他家的时候 , 他正在吃饭', 'zas id wil leit nenx zaid , nenx hangd qend nongx gad hmangt', NULL, 'hmong_import'),
('HM0152', '我正要去找他 , 他就来了', 'wil jef hangd qend dax mongl vangs nenx , nenx ghax dax yangx', NULL, 'hmong_import'),
('HM0153', '他到过北京 , 也到过上海', 'nenx leit beif jenb , seix leit sangd haix', NULL, 'hmong_import'),
('HM0154', '他洗完衣服还挑水回家', 'nenx hsot jul ud yangx seix dail ghangt eb lol zaid', NULL, 'hmong_import'),
('HM0155', '我家今年种了五亩花生', 'hniut nongd wil zaid jenl zab mux las bangf huab senb', NULL, 'hmong_import'),
('HM0156', '我要去看电影', 'wil nongd dax mongl hxid dieed yinx', NULL, 'hmong_import'),
('HM0157', '我要上法院去告他', 'wil nongd mongl faf weed ghot nenx', NULL, 'hmong_import'),
('HM0158', '我们要互相帮助', 'bib nongd xit bangb', NULL, 'hmong_import'),
('HM0159', '他们俩很相爱', 'nenx ob laix hsat xit vut', NULL, 'hmong_import'),
('HM0160', '你们不要互相泼水', 'mongx ax gid laix hfat eb tangt laix', NULL, 'hmong_import'),
('HM0161', '飞的鸟不容易打', 'dol nes yangt ax vut bangd', NULL, 'hmong_import'),
('HM0162', '蒸的饭和煮的饭一样好吃', 'giad jib hof giad hot dub xit dangf vut nongx', NULL, 'hmong_import'),
('HM0163', '那只刚买来的鸡下蛋了', 'dail gheib hangd qend mail lol id nas git yangx', NULL, 'hmong_import'),
('HM0164', '我是本地人', 'wil dis naix diub fangb', NULL, 'hmong_import'),
('HM0165', '今天是三月初五', 'hnaib nongd dis hlat bib jul zab haib', NULL, 'hmong_import'),
('HM0166', '这位是我的父亲', 'dail nongd wil bad', NULL, 'hmong_import'),
('HM0167', '今天真是好日子', 'hnaib nongd dis ghab haib hsat vut', NULL, 'hmong_import'),
('HM0168', '这封信是不是你写的', 'fongb xend nongd dis ax dis mongx hxad', NULL, 'hmong_import'),
('HM0169', '有人来找你', 'maix naix dax vangs mongx', NULL, 'hmong_import'),
('HM0170', '他不愿意说', 'nenx ax hangb hot', NULL, 'hmong_import'),
('HM0171', '我们大家都应该努力干活', 'bib bas naix nongd deb nongt gangt ngas ait gheb', NULL, 'hmong_import'),
('HM0172', '你必须在天黑以前回来', 'mongx nongt niangb diot zek waix gid denx diangd lol', NULL, 'hmong_import'),
('HM0173', '大风把寨旁的树吹断了', 'jent cob ghab but vangl bangf dail det gos yangx', NULL, 'hmong_import'),
('HM0174', '他打死了两条老蛇', 'nenx dib das ob dail nangb lul', NULL, 'hmong_import'),
('HM0175', '太阳晒得田都裂了', 'laib haib pid laib lix dus zaf yangx', NULL, 'hmong_import'),
('HM0176', '拿一根拐棍来', 'dad ib diangb dlent lol', NULL, 'hmong_import'),
('HM0177', '小姑娘把篮子提来了', 'dail daib pik yut dad jil kent dax yangx', NULL, 'hmong_import'),
('HM0178', '弟弟爬上树去捉鸟', 'dail dial yut jit det dax mongl wil nes', NULL, 'hmong_import'),
('HM0179', '这截木头我一个人也扛得起', 'ib ghaid det nongd wil jus laix seix gid niangs', NULL, 'hmong_import'),
('HM0180', '这个故事三天三夜也讲不完', 'diux dliangb xangs nongd baix jangx bib haib bib hmangt seix ax jul', NULL, 'hmong_import'),
('HM0181', '这扇门打不开', 'laib diux nongd buk ax lol', NULL, 'hmong_import'),
('HM0182', '那种果子吃不得', 'laib zend nongd nongx ax dot', NULL, 'hmong_import'),
('HM0183', '他搓了一条长长的绳子', 'nenx hfab jangx jox hlat dad dad', NULL, 'hmong_import'),
('HM0184', '房子前面有一棵高高的树', 'laib zaid dangl denx hfud maix ib dail det hvib hvib', NULL, 'hmong_import'),
('HM0185', '这条路弯弯曲曲的', 'ib jox gid nongd ghongl ghongl renk', NULL, 'hmong_import'),
('HM0186', '今年这块田的稻子长得绿油油的', 'hniut nongd laib lix nax nongd nox bongb yongb', NULL, 'hmong_import'),
('HM0187', '这些果子酸溜溜的', 'dol zend nongd fangd gangb gangb', NULL, 'hmong_import'),
('HM0188', '病人的脸白惨惨的', 'dail naix mongb bangf mangl mais dlub bongs gangs', NULL, 'hmong_import'),
('HM0189', '小孩的牙齿白森森的', 'dail ghab daib bangf laib hmid dlub ghongl dongl', NULL, 'hmong_import'),
('HM0190', '这地方臭烘烘的', 'bet nongd hangt denl denl', NULL, 'hmong_import'),
('HM0191', '这锅肉香喷喷的', 'ib wil ngax nongd daib mongl diab ab', NULL, 'hmong_import'),
('HM0192', '这件衣服湿漉漉的', 'ib pangb ud nongd xuf eb geb lieb', NULL, 'hmong_import'),
('HM0193', '整个粮仓堆满完', 'ib laib rongl nongd dub baid jul', NULL, 'hmong_import'),
('HM0194', '你是一个好人', 'mongx dis ib dail naix vut', NULL, 'hmong_import'),
('HM0195', '他是一个坏人', 'nenx dis ib dail naix yangf', NULL, 'hmong_import'),
('HM0196', '姐姐买了一件新的花衣服', 'ab ad mail dot ib pangb ud bangx', NULL, 'hmong_import'),
('HM0197', '砍棵大树做柱子', 'dod ib dail det hlieb lol ait ghab dongs zaid', NULL, 'hmong_import'),
('HM0198', '大的卖四角钱', 'laib hlieb mail dlob jof nix', NULL, 'hmong_import'),
('HM0199', '小的卖两角钱', 'laib yut mail ob jof nix', NULL, 'hmong_import'),
('HM0200', '这座山高极了', 'laib bok nongd hvib lins niox', NULL, 'hmong_import')
ON DUPLICATE KEY UPDATE word_text = VALUES(word_text), pinyin = VALUES(pinyin), category = VALUES(category);

-- 导入音频样本
INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0001', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0001.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0001'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0001');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0002', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0002.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0002'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0002');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0003', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0003.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0003'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0003');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0004', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0004.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0004'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0004');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0005', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0005.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0005'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0005');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0006', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0006.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0006'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0006');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0007', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0007.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0007'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0007');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0008', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0008.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0008'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0008');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0009', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0009.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0009'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0009');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0010', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0010.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0010'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0010');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0011', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0011.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0011'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0011');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0012', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0012.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0012'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0012');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0013', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0013.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0013'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0013');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0014', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0014.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0014'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0014');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0015', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0015.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0015'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0015');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0016', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0016.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0016'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0016');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0017', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0017.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0017'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0017');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0018', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0018.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0018'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0018');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0019', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0019.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0019'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0019');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0020', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0020.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0020'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0020');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0021', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0021.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0021'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0021');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0022', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0022.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0022'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0022');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0023', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0023.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0023'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0023');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0024', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0024.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0024'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0024');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0025', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0025.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0025'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0025');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0026', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0026.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0026'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0026');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0027', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0027.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0027'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0027');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0028', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0028.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0028'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0028');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0029', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0029.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0029'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0029');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0030', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0030.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0030'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0030');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0031', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0031.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0031'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0031');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0032', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0032.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0032'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0032');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0033', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0033.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0033'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0033');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0034', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0034.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0034'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0034');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0035', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0035.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0035'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0035');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0036', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0036.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0036'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0036');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0037', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0037.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0037'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0037');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0038', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0038.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0038'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0038');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0039', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0039.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0039'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0039');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0040', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0040.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0040'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0040');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0041', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0041.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0041'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0041');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0042', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0042.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0042'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0042');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0043', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0043.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0043'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0043');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0044', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0044.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0044'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0044');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0045', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0045.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0045'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0045');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0046', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0046.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0046'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0046');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0047', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0047.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0047'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0047');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0048', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0048.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0048'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0048');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0049', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0049.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0049'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0049');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0050', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0050.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0050'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0050');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0051', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0051.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0051'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0051');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0052', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0052.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0052'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0052');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0053', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0053.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0053'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0053');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0054', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0054.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0054'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0054');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0055', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0055.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0055'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0055');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0056', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0056.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0056'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0056');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0057', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0057.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0057'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0057');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0058', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0058.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0058'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0058');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0059', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0059.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0059'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0059');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0060', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0060.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0060'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0060');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0061', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0061.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0061'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0061');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0062', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0062.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0062'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0062');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0063', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0063.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0063'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0063');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0064', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0064.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0064'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0064');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0065', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0065.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0065'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0065');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0066', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0066.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0066'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0066');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0067', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0067.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0067'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0067');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0068', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0068.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0068'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0068');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0069', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0069.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0069'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0069');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0070', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0070.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0070'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0070');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0071', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0071.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0071'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0071');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0072', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0072.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0072'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0072');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0073', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0073.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0073'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0073');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0074', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0074.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0074'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0074');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0075', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0075.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0075'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0075');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0076', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0076.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0076'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0076');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0077', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0077.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0077'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0077');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0078', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0078.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0078'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0078');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0079', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0079.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0079'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0079');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0080', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0080.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0080'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0080');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0081', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0081.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0081'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0081');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0082', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0082.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0082'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0082');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0083', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0083.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0083'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0083');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0084', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0084.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0084'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0084');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0085', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0085.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0085'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0085');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0086', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0086.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0086'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0086');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0087', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0087.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0087'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0087');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0088', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0088.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0088'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0088');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0089', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0089.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0089'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0089');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0090', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0090.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0090'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0090');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0091', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0091.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0091'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0091');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0092', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0092.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0092'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0092');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0093', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0093.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0093'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0093');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0094', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0094.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0094'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0094');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0095', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0095.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0095'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0095');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0096', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0096.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0096'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0096');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0097', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0097.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0097'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0097');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0098', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0098.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0098'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0098');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0099', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0099.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0099'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0099');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0100', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0100.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0100'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0100');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0101', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0101.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0101'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0101');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0102', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0102.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0102'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0102');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0103', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0103.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0103'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0103');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0104', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0104.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0104'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0104');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0105', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0105.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0105'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0105');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0106', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0106.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0106'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0106');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0107', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0107.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0107'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0107');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0108', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0108.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0108'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0108');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0109', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0109.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0109'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0109');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0110', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0110.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0110'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0110');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0111', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0111.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0111'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0111');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0112', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0112.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0112'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0112');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0113', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0113.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0113'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0113');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0114', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0114.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0114'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0114');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0115', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0115.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0115'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0115');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0116', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0116.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0116'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0116');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0117', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0117.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0117'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0117');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0118', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0118.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0118'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0118');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0119', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0119.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0119'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0119');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0120', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0120.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0120'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0120');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0121', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0121.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0121'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0121');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0122', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0122.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0122'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0122');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0123', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0123.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0123'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0123');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0124', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0124.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0124'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0124');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0125', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0125.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0125'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0125');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0126', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0126.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0126'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0126');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0127', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0127.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0127'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0127');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0128', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0128.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0128'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0128');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0129', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0129.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0129'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0129');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0130', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0130.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0130'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0130');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0131', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0131.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0131'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0131');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0132', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0132.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0132'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0132');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0133', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0133.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0133'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0133');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0134', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0134.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0134'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0134');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0135', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0135.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0135'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0135');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0136', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0136.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0136'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0136');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0137', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0137.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0137'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0137');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0138', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0138.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0138'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0138');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0139', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0139.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0139'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0139');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0140', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0140.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0140'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0140');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0141', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0141.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0141'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0141');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0142', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0142.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0142'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0142');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0143', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0143.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0143'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0143');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0144', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0144.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0144'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0144');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0145', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0145.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0145'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0145');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0146', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0146.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0146'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0146');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0147', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0147.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0147'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0147');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0148', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0148.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0148'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0148');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0149', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0149.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0149'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0149');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0150', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0150.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0150'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0150');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0151', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0151.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0151'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0151');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0152', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0152.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0152'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0152');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0153', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0153.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0153'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0153');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0154', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0154.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0154'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0154');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0155', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0155.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0155'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0155');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0156', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0156.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0156'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0156');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0157', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0157.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0157'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0157');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0158', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0158.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0158'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0158');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0159', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0159.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0159'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0159');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0160', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0160.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0160'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0160');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0161', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0161.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0161'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0161');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0162', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0162.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0162'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0162');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0163', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0163.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0163'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0163');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0164', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0164.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0164'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0164');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0165', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0165.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0165'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0165');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0166', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0166.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0166'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0166');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0167', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0167.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0167'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0167');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0168', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0168.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0168'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0168');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0169', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0169.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0169'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0169');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0170', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0170.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0170'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0170');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0171', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0171.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0171'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0171');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0172', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0172.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0172'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0172');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0173', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0173.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0173'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0173');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0174', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0174.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0174'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0174');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0175', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0175.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0175'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0175');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0176', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0176.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0176'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0176');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0177', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0177.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0177'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0177');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0178', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0178.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0178'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0178');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0179', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0179.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0179'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0179');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0180', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0180.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0180'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0180');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0181', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0181.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0181'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0181');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0182', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0182.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0182'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0182');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0183', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0183.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0183'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0183');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0184', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0184.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0184'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0184');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0185', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0185.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0185'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0185');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0186', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0186.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0186'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0186');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0187', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0187.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0187'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0187');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0188', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0188.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0188'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0188');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0189', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0189.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0189'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0189');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0190', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0190.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0190'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0190');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0191', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0191.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0191'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0191');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0192', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0192.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0192'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0192');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0193', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0193.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0193'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0193');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0194', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0194.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0194'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0194');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0195', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0195.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0195'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0195');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0196', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0196.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0196'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0196');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0197', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0197.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0197'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0197');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0198', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0198.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0198'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0198');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0199', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0199.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0199'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0199');

INSERT INTO audio_samples (sample_id, speaker_id, word_id, audio_path, duration_ms, sample_rate, bit_depth, channels, quality_flag)
SELECT 'HS0200', s.id, v.id, 'D:/BaiduNetdiskDownload/HmongSpeech/Wave/0200.wav', NULL, 16000, 16, 1, 'OK'
FROM speakers s, vocabulary v
WHERE s.speaker_id = 'HS1' AND v.word_id = 'HM0200'
AND NOT EXISTS (SELECT 1 FROM audio_samples a WHERE a.sample_id = 'HS0200');

