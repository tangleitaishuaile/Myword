SET NAMES UTF8;
DROP DATABASE IF EXISTS csdn;
CREATE DATABASE csdn CHARSET=UTF8;
USE csdn;

/**用户表**/
CREATE TABLE csdn_user(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(16),
    upwd  VARCHAR(16),
    username VARCHAR(32),   /**用户名**/
    headpic VARCHAR(128),   /**用户头像**/
    bgpic VARCHAR(128),     /**用户背景墙**/
    sign VARCHAR(128),      
    school VARCHAR(32),
    company VARCHAR(32),
    gander INT
);
INSERT INTO csdn_user VALUES(null,"tom",'123',"汤姆猫","http://127.0.0.1:4000/userAvatar/tom.jpg","http://127.0.0.1:4000/zzz.jpeg",'goodgoodstudy,daydayup','加州理工','Tencent',1);
INSERT INTO csdn_user VALUES(null,"jerry",'123',"杰瑞鼠","http://127.0.0.1:4000/userAvatar/jerry.jpg","127.0.0.1:4000/img/01.jpg","我是真的帅","清华","达内",0);
INSERT INTO csdn_user VALUES(null,"tony",'123',"托尼狗","http://127.0.0.1:4000/userAvatar/tony.jpg","127.0.0.1:4000/img/01.jpg","吃好喝好睡好","剑桥","达内",0);


/**博文 帖子 动态表**/
CREATE TABLE csdn_text(
    tid INT PRIMARY KEY AUTO_INCREMENT,
    type INT,       /**blog:10 帖 子 Blink:30**/
    userid INT,
    title VARCHAR(128),
    content TEXT,
    classes VARCHAR(32), /**此文章所处的分类标签**/
    time BIGINT,  /**发布时间**/
    reading INT,    /**浏览量**/
    star TEXT,      /**点赞用户id组成的字段**/
    collect INT    /**收藏总数 **/ 
);
INSERT INTO csdn_text VALUES(null,10,1,"React中的核心概念
","React中几个核心的概念
虚拟DOM（Virtual Document Object Model）
DOM的本质是什么：就是用JS表示的UI元素
DOM和虚拟DOM的区别：DOM是由浏览器中的JS提供功能，所以我们只能人为的使用 浏览器提供的固定的API来操作DOM对象；虚拟DOM并不是由浏览器提供的，而是我们程序员手动模拟实现的，类似于浏览器中的DOM，但是有着本质的区别
虚拟DOM：优化频繁操作DOM引发性能问题的产物，将页面的状态抽象为JS对象的形式，本质上是JS和真实DOM的中间层。当我们想用JS脚本大批量进行DOM操作时，会优先作用于虚拟DOM这个JS对象，最后通过对比将要改动的部分通知并更新到真实的DOM上。
Diff算法
tree diff:新旧DOM树，逐层对比的方式，就叫做 tree diff,每当我们从前到后，把所有层的节点对比完后，必然能够找到那些 需要被更新的元素；
component diff：在对比每一层的时候，组件之间的对比，叫做 component diff;当对比组件的时候，如果两个组件的类型相同，则暂时认为这个组件不需要被更新，如果组件的类型不同，则立即将旧组件移除，新建一个组件，替换到被移除的位置；
element diff:在组件中，每个元素之间也要进行对比，那么，元素级别的对比，叫做 element diff；
key：key这个属性，可以把 页面上的 DOM节点 和 虚拟DOM中的对象，做一层关联关系；
————————————————
版权声明：本文为CSDN博主「阳光下的冷静」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/m0_37686205/article/details/102575363","前端",1571316916175,1000,"1,2,3",2);
INSERT INTO csdn_text VALUES(null,10,2,"详细的JavaScript基础语法-中-函数
","React中几个核心的概念
虚拟DOM（Virtual Document Object Model）
DOM的本质是什么：就是用JS表示的UI元素
DOM和虚拟DOM的区别：DOM是由浏览器中的JS提供功能，所以我们只能人为的使用 浏览器提供的固定的API来操作DOM对象；虚拟DOM并不是由浏览器提供的，而是我们程序员手动模拟实现的，类似于浏览器中的DOM，但是有着本质的区别
虚拟DOM：优化频繁操作DOM引发性能问题的产物，将页面的状态抽象为JS对象的形式，本质上是JS和真实DOM的中间层。当我们想用JS脚本大批量进行DOM操作时，会优先作用于虚拟DOM这个JS对象，最后通过对比将要改动的部分通知并更新到真实的DOM上。
Diff算法
tree diff:新旧DOM树，逐层对比的方式，就叫做 tree diff,每当我们从前到后，把所有层的节点对比完后，必然能够找到那些 需要被更新的元素；
component diff：在对比每一层的时候，组件之间的对比，叫做 component diff;当对比组件的时候，如果两个组件的类型相同，则暂时认为这个组件不需要被更新，如果组件的类型不同，则立即将旧组件移除，新建一个组件，替换到被移除的位置；
element diff:在组件中，每个元素之间也要进行对比，那么，元素级别的对比，叫做 element diff；
key：key这个属性，可以把 页面上的 DOM节点 和 虚拟DOM中的对象，做一层关联关系；
————————————————
版权声明：本文为CSDN博主「阳光下的冷静」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/m0_37686205/article/details/102575363","前端",1571316916175,1000,"1,2,3",2);
INSERT INTO csdn_text VALUES(null,10,3,"微信小程序全栈开发课程】原生小程序框架介绍
","React中几个核心的概念
虚拟DOM（Virtual Document Object Model）
DOM的本质是什么：就是用JS表示的UI元素
DOM和虚拟DOM的区别：DOM是由浏览器中的JS提供功能，所以我们只能人为的使用 浏览器提供的固定的API来操作DOM对象；虚拟DOM并不是由浏览器提供的，而是我们程序员手动模拟实现的，类似于浏览器中的DOM，但是有着本质的区别
虚拟DOM：优化频繁操作DOM引发性能问题的产物，将页面的状态抽象为JS对象的形式，本质上是JS和真实DOM的中间层。当我们想用JS脚本大批量进行DOM操作时，会优先作用于虚拟DOM这个JS对象，最后通过对比将要改动的部分通知并更新到真实的DOM上。
Diff算法
tree diff:新旧DOM树，逐层对比的方式，就叫做 tree diff,每当我们从前到后，把所有层的节点对比完后，必然能够找到那些 需要被更新的元素；
component diff：在对比每一层的时候，组件之间的对比，叫做 component diff;当对比组件的时候，如果两个组件的类型相同，则暂时认为这个组件不需要被更新，如果组件的类型不同，则立即将旧组件移除，新建一个组件，替换到被移除的位置；
element diff:在组件中，每个元素之间也要进行对比，那么，元素级别的对比，叫做 element diff；
key：key这个属性，可以把 页面上的 DOM节点 和 虚拟DOM中的对象，做一层关联关系；
————————————————
版权声明：本文为CSDN博主「阳光下的冷静」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/m0_37686205/article/details/102575363","前端",1571316916175,1000,"1,2",1);
INSERT INTO csdn_text VALUES(null,10,1,"【微信小程序全栈开发课程】原生小程序框架介绍
","React中几个核心的概念
虚拟DOM（Virtual Document Object Model）
DOM的本质是什么：就是用JS表示的UI元素
DOM和虚拟DOM的区别：DOM是由浏览器中的JS提供功能，所以我们只能人为的使用 浏览器提供的固定的API来操作DOM对象；虚拟DOM并不是由浏览器提供的，而是我们程序员手动模拟实现的，类似于浏览器中的DOM，但是有着本质的区别
虚拟DOM：优化频繁操作DOM引发性能问题的产物，将页面的状态抽象为JS对象的形式，本质上是JS和真实DOM的中间层。当我们想用JS脚本大批量进行DOM操作时，会优先作用于虚拟DOM这个JS对象，最后通过对比将要改动的部分通知并更新到真实的DOM上。
Diff算法
tree diff:新旧DOM树，逐层对比的方式，就叫做 tree diff,每当我们从前到后，把所有层的节点对比完后，必然能够找到那些 需要被更新的元素；
component diff：在对比每一层的时候，组件之间的对比，叫做 component diff;当对比组件的时候，如果两个组件的类型相同，则暂时认为这个组件不需要被更新，如果组件的类型不同，则立即将旧组件移除，新建一个组件，替换到被移除的位置；
element diff:在组件中，每个元素之间也要进行对比，那么，元素级别的对比，叫做 element diff；
key：key这个属性，可以把 页面上的 DOM节点 和 虚拟DOM中的对象，做一层关联关系；
————————————————
版权声明：本文为CSDN博主「阳光下的冷静」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/m0_37686205/article/details/102575363","前端",1571316916175,1000,"2,3",0);
INSERT INTO csdn_text VALUES(null,10,2,"React中的核心概念
","React中几个核心的概念
虚拟DOM（Virtual Document Object Model）
DOM的本质是什么：就是用JS表示的UI元素
DOM和虚拟DOM的区别：DOM是由浏览器中的JS提供功能，所以我们只能人为的使用 浏览器提供的固定的API来操作DOM对象；虚拟DOM并不是由浏览器提供的，而是我们程序员手动模拟实现的，类似于浏览器中的DOM，但是有着本质的区别
虚拟DOM：优化频繁操作DOM引发性能问题的产物，将页面的状态抽象为JS对象的形式，本质上是JS和真实DOM的中间层。当我们想用JS脚本大批量进行DOM操作时，会优先作用于虚拟DOM这个JS对象，最后通过对比将要改动的部分通知并更新到真实的DOM上。
Diff算法
tree diff:新旧DOM树，逐层对比的方式，就叫做 tree diff,每当我们从前到后，把所有层的节点对比完后，必然能够找到那些 需要被更新的元素；
component diff：在对比每一层的时候，组件之间的对比，叫做 component diff;当对比组件的时候，如果两个组件的类型相同，则暂时认为这个组件不需要被更新，如果组件的类型不同，则立即将旧组件移除，新建一个组件，替换到被移除的位置；
element diff:在组件中，每个元素之间也要进行对比，那么，元素级别的对比，叫做 element diff；
key：key这个属性，可以把 页面上的 DOM节点 和 虚拟DOM中的对象，做一层关联关系；
————————————————
版权声明：本文为CSDN博主「阳光下的冷静」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/m0_37686205/article/details/102575363","前端",1571316916175,1000,"",0);
INSERT INTO csdn_text VALUES(null,10,3,"React中的核心概念
","React中几个核心的概念
虚拟DOM（Virtual Document Object Model）
DOM的本质是什么：就是用JS表示的UI元素
DOM和虚拟DOM的区别：DOM是由浏览器中的JS提供功能，所以我们只能人为的使用 浏览器提供的固定的API来操作DOM对象；虚拟DOM并不是由浏览器提供的，而是我们程序员手动模拟实现的，类似于浏览器中的DOM，但是有着本质的区别
虚拟DOM：优化频繁操作DOM引发性能问题的产物，将页面的状态抽象为JS对象的形式，本质上是JS和真实DOM的中间层。当我们想用JS脚本大批量进行DOM操作时，会优先作用于虚拟DOM这个JS对象，最后通过对比将要改动的部分通知并更新到真实的DOM上。
Diff算法
tree diff:新旧DOM树，逐层对比的方式，就叫做 tree diff,每当我们从前到后，把所有层的节点对比完后，必然能够找到那些 需要被更新的元素；
component diff：在对比每一层的时候，组件之间的对比，叫做 component diff;当对比组件的时候，如果两个组件的类型相同，则暂时认为这个组件不需要被更新，如果组件的类型不同，则立即将旧组件移除，新建一个组件，替换到被移除的位置；
element diff:在组件中，每个元素之间也要进行对比，那么，元素级别的对比，叫做 element diff；
key：key这个属性，可以把 页面上的 DOM节点 和 虚拟DOM中的对象，做一层关联关系；
————————————————
版权声明：本文为CSDN博主「阳光下的冷静」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/m0_37686205/article/details/102575363","前端",1571316916175,1000,"3",1);
INSERT INTO csdn_text VALUES(null,10,1,"React中的核心概念
","React中几个核心的概念
虚拟DOM（Virtual Document Object Model）
DOM的本质是什么：就是用JS表示的UI元素
DOM和虚拟DOM的区别：DOM是由浏览器中的JS提供功能，所以我们只能人为的使用 浏览器提供的固定的API来操作DOM对象；虚拟DOM并不是由浏览器提供的，而是我们程序员手动模拟实现的，类似于浏览器中的DOM，但是有着本质的区别
虚拟DOM：优化频繁操作DOM引发性能问题的产物，将页面的状态抽象为JS对象的形式，本质上是JS和真实DOM的中间层。当我们想用JS脚本大批量进行DOM操作时，会优先作用于虚拟DOM这个JS对象，最后通过对比将要改动的部分通知并更新到真实的DOM上。
Diff算法
tree diff:新旧DOM树，逐层对比的方式，就叫做 tree diff,每当我们从前到后，把所有层的节点对比完后，必然能够找到那些 需要被更新的元素；
component diff：在对比每一层的时候，组件之间的对比，叫做 component diff;当对比组件的时候，如果两个组件的类型相同，则暂时认为这个组件不需要被更新，如果组件的类型不同，则立即将旧组件移除，新建一个组件，替换到被移除的位置；
element diff:在组件中，每个元素之间也要进行对比，那么，元素级别的对比，叫做 element diff；
key：key这个属性，可以把 页面上的 DOM节点 和 虚拟DOM中的对象，做一层关联关系；
————————————————
版权声明：本文为CSDN博主「阳光下的冷静」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/m0_37686205/article/details/102575363","前端",1571316916175,1000,"1,2,3",3);
INSERT INTO csdn_text VALUES(null,10,2,"React中的核心概念
","React中几个核心的概念
虚拟DOM（Virtual Document Object Model）
DOM的本质是什么：就是用JS表示的UI元素
DOM和虚拟DOM的区别：DOM是由浏览器中的JS提供功能，所以我们只能人为的使用 浏览器提供的固定的API来操作DOM对象；虚拟DOM并不是由浏览器提供的，而是我们程序员手动模拟实现的，类似于浏览器中的DOM，但是有着本质的区别
虚拟DOM：优化频繁操作DOM引发性能问题的产物，将页面的状态抽象为JS对象的形式，本质上是JS和真实DOM的中间层。当我们想用JS脚本大批量进行DOM操作时，会优先作用于虚拟DOM这个JS对象，最后通过对比将要改动的部分通知并更新到真实的DOM上。
Diff算法
tree diff:新旧DOM树，逐层对比的方式，就叫做 tree diff,每当我们从前到后，把所有层的节点对比完后，必然能够找到那些 需要被更新的元素；
component diff：在对比每一层的时候，组件之间的对比，叫做 component diff;当对比组件的时候，如果两个组件的类型相同，则暂时认为这个组件不需要被更新，如果组件的类型不同，则立即将旧组件移除，新建一个组件，替换到被移除的位置；
element diff:在组件中，每个元素之间也要进行对比，那么，元素级别的对比，叫做 element diff；
key：key这个属性，可以把 页面上的 DOM节点 和 虚拟DOM中的对象，做一层关联关系；
————————————————
版权声明：本文为CSDN博主「阳光下的冷静」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/m0_37686205/article/details/102575363","前端",1571316916175,1000,"1,3",2);



/**评论回复表**/
CREATE TABLE csdn_discuss(
    did INT PRIMARY KEY AUTO_INCREMENT,
    textid INT,     /**评论/回复 所在的文章id**/
    userid INT,     /**做出评论/回复的用户id**/
    content TEXT,   
    time BIGINT,
    parentid INT    /**被评论/回复的那条评论的id 如果不存在被评论的id则此条为评论 如果存在被评论的那条评论id则此条为回复**/
);

INSERT INTO csdn_discuss VALUES (null,1,1,"我要抓老鼠",1571479328105,
null);
INSERT INTO csdn_discuss VALUES (null,1,2,"我不怕汤姆",1571479328105,
1);
INSERT INTO csdn_discuss VALUES (null,1,3,"楼上两个铁憨憨",1571479328105,
null);
INSERT INTO csdn_discuss VALUES (null,2,1,"我要抓老鼠",1571479328105,
null);
INSERT INTO csdn_discuss VALUES (null,2,2,"我不怕汤姆",1571479328105,
3);
INSERT INTO csdn_discuss VALUES (null,2,3,"楼上两个铁憨憨",1571479328105,
3);
INSERT INTO csdn_discuss VALUES (null,3,1,"我要抓老鼠",1571479328105,
null);
INSERT INTO csdn_discuss VALUES (null,3,2,"我不怕汤姆",1571479328105,
6);
INSERT INTO csdn_discuss VALUES (null,3,3,"楼上两个铁憨憨",1571479328105,
7);




/**关注 粉丝 书籍 收藏 列表**/
CREATE TABLE csdn_follow(
    fid INT PRIMARY KEY AUTO_INCREMENT,
    userid INT,
    follower TEXT,  /**该用户关注的用户id组成的字段**/
    status TEXT,    /**该用户的粉丝id组成的字段**/
    books TEXT,     /**该用户书架中书籍id组成的字段**/
    collects TEXT,  /**该用户收藏的博文动态帖子的id组成的字段**/ 
    classes TEXT    /**该用户选择的分类组成的字段 推荐和关注是固定分类不用保存**/
);
INSERT INTO csdn_follow VALUES (null,1,"3,2","3,2","1,2,3","1,2,3","区块链,大数据,人工智能");
INSERT INTO csdn_follow VALUES (null,2,"1,3","1,3","4,5,6","2,4,5","java,javascript,前端");
INSERT INTO csdn_follow VALUES (null,3,"2,1","1,2","7,8,9,10","1,5,6,8","安全,运维,物联网");



/**电子书列表**/
CREATE TABLE csdn_books(
    bid INT PRIMARY KEY AUTO_INCREMENT,
    bname VARCHAR(64),
    author VARCHAR(32),     /**作者**/
    synopsis VARCHAR(256),  /**简介**/
    list  TEXT,             /**目录列表**/
    bookpic VARCHAR(128)    
);

INSERT INTO csdn_books  VALUES 
(null,"西游记","吴冠中","1986-02-02","
武松打虎/
三过景阳冈/
花和尚单打二龙山/
林冲水寨大并火/
黑旋风沂岭杀四虎/
插翅虎枷打白秀英/
忠义堂石碣受天文/
托塔天王梦中显圣/
吴用智赚玉麒麟/
梁山泊十面埋伏/
宋公明两赢童贯",
"http://127.0.0.1:4000/study_img/08.jpg");


INSERT INTO csdn_books VALUES 
(null,"Linux程序设计","张三","1998-02-02","首卷语/微软CTO伟青：'程序员35岁就被淘汰'是个
伪概念/中国第一代程序员简史/中国龙剑晶的程序人生/这几天心里颇不宁静。/
沿着荷塘，是一条曲折的小煤屑路。/
路上只我一个人，背着手踱着。/
像今晚上，一个人在这苍茫的月下/什么都可以想，什么都可以不想，便觉是个自由的人。/
曲曲折折的荷塘上面，弥望的是田田的叶子。/
忽然想起采莲的事情来了。",
"http://127.0.0.1:4000/study_img/01.jpg");


INSERT INTO csdn_books   VALUES 
(null,"程序员的修炼之道","韩磊","1998-02-02","首卷语/微软CTO伟青：'程序员35岁就被淘汰'是个
伪概念/中国第一代程序员简史/中国龙剑晶的程序人生/这几天心里颇不宁静。/
沿着荷塘，是一条曲折的小煤屑路。/
路上只我一个人，背着手踱着。/
像今晚上，一个人在这苍茫的月下/什么都可以想，什么都可以不想，便觉是个自由的人。/
曲曲折折的荷塘上面，弥望的是田田的叶子。/
忽然想起采莲的事情来了。",
"http://127.0.0.1:4000/study_img/03.jpg");
INSERT INTO csdn_books  VALUES 
(null,"西游记","吴冠中","1986-02-02","
武松打虎/
三过景阳冈/
花和尚单打二龙山/
林冲水寨大并火/
黑旋风沂岭杀四虎/
插翅虎枷打白秀英/
忠义堂石碣受天文/
托塔天王梦中显圣/
吴用智赚玉麒麟/
梁山泊十面埋伏/
宋公明两赢童贯",
"http://127.0.0.1:4000/study_img/08.jpg");


INSERT INTO csdn_books VALUES 
(null,"Linux程序设计","张三","1998-02-02","首卷语/微软CTO伟青：'程序员35岁就被淘汰'是个
伪概念/中国第一代程序员简史/中国龙剑晶的程序人生/这几天心里颇不宁静。/
沿着荷塘，是一条曲折的小煤屑路。/
路上只我一个人，背着手踱着。/
像今晚上，一个人在这苍茫的月下/什么都可以想，什么都可以不想，便觉是个自由的人。/
曲曲折折的荷塘上面，弥望的是田田的叶子。/
忽然想起采莲的事情来了。",
"http://127.0.0.1:4000/study_img/01.jpg");


INSERT INTO csdn_books   VALUES 
(null,"程序员的修炼之道","韩磊","1998-02-02","首卷语/微软CTO伟青：'程序员35岁就被淘汰'是个
伪概念/中国第一代程序员简史/中国龙剑晶的程序人生/这几天心里颇不宁静。/
沿着荷塘，是一条曲折的小煤屑路。/
路上只我一个人，背着手踱着。/
像今晚上，一个人在这苍茫的月下/什么都可以想，什么都可以不想，便觉是个自由的人。/
曲曲折折的荷塘上面，弥望的是田田的叶子。/
忽然想起采莲的事情来了。",
"http://127.0.0.1:4000/study_img/03.jpg");INSERT INTO csdn_books  VALUES 
(null,"西游记","吴冠中","1986-02-02","
武松打虎/
三过景阳冈/
花和尚单打二龙山/
林冲水寨大并火/
黑旋风沂岭杀四虎/
插翅虎枷打白秀英/
忠义堂石碣受天文/
托塔天王梦中显圣/
吴用智赚玉麒麟/
梁山泊十面埋伏/
宋公明两赢童贯",
"http://127.0.0.1:4000/study_img/08.jpg");


INSERT INTO csdn_books VALUES 
(null,"Linux程序设计","张三","1998-02-02","首卷语/微软CTO伟青：'程序员35岁就被淘汰'是个
伪概念/中国第一代程序员简史/中国龙剑晶的程序人生/这几天心里颇不宁静。/
沿着荷塘，是一条曲折的小煤屑路。/
路上只我一个人，背着手踱着。/
像今晚上，一个人在这苍茫的月下/什么都可以想，什么都可以不想，便觉是个自由的人。/
曲曲折折的荷塘上面，弥望的是田田的叶子。/
忽然想起采莲的事情来了。",
"http://127.0.0.1:4000/study_img/01.jpg");


INSERT INTO csdn_books   VALUES 
(null,"程序员的修炼之道","韩磊","1998-02-02","首卷语/微软CTO伟青：'程序员35岁就被淘汰'是个
伪概念/中国第一代程序员简史/中国龙剑晶的程序人生/这几天心里颇不宁静。/
沿着荷塘，是一条曲折的小煤屑路。/
路上只我一个人，背着手踱着。/
像今晚上，一个人在这苍茫的月下/什么都可以想，什么都可以不想，便觉是个自由的人。/
曲曲折折的荷塘上面，弥望的是田田的叶子。/
忽然想起采莲的事情来了。",
"http://127.0.0.1:4000/study_img/03.jpg");INSERT INTO csdn_books  VALUES 
(null,"西游记","吴冠中","1986-02-02","
武松打虎/
三过景阳冈/
花和尚单打二龙山/
林冲水寨大并火/
黑旋风沂岭杀四虎/
插翅虎枷打白秀英/
忠义堂石碣受天文/
托塔天王梦中显圣/
吴用智赚玉麒麟/
梁山泊十面埋伏/
宋公明两赢童贯",
"http://127.0.0.1:4000/study_img/08.jpg");


INSERT INTO csdn_books VALUES 
(null,"Linux程序设计","张三","1998-02-02","首卷语/微软CTO伟青：'程序员35岁就被淘汰'是个
伪概念/中国第一代程序员简史/中国龙剑晶的程序人生/这几天心里颇不宁静。/
沿着荷塘，是一条曲折的小煤屑路。/
路上只我一个人，背着手踱着。/
像今晚上，一个人在这苍茫的月下/什么都可以想，什么都可以不想，便觉是个自由的人。/
曲曲折折的荷塘上面，弥望的是田田的叶子。/
忽然想起采莲的事情来了。",
"http://127.0.0.1:4000/study_img/01.jpg");


INSERT INTO csdn_books   VALUES 
(null,"程序员的修炼之道","韩磊","1998-02-02","首卷语/微软CTO伟青：'程序员35岁就被淘汰'是个
伪概念/中国第一代程序员简史/中国龙剑晶的程序人生/这几天心里颇不宁静。/
沿着荷塘，是一条曲折的小煤屑路。/
路上只我一个人，背着手踱着。/
像今晚上，一个人在这苍茫的月下/什么都可以想，什么都可以不想，便觉是个自由的人。/
曲曲折折的荷塘上面，弥望的是田田的叶子。/
忽然想起采莲的事情来了。",
"http://127.0.0.1:4000/study_img/03.jpg");

/** 论坛帖子列表 **/
CREATE TABLE csdn_comment(
    tid INT PRIMARY KEY AUTO_INCREMENT,
    type INT,       /**blog:10 帖子:20 Blink:30**/
    userid INT,
    title VARCHAR(128),
    content TEXT,
    classes VARCHAR(32), /**此文章所处的分类标签**/
    time DATETIME,  /**发布时间**/
    reading INT,    /**浏览量**/
    star TEXT,      /**点赞用户id组成的字段**/
    collect INT,    /**收藏总数 **/ 
    can VARCHAR(255),
    grades VARCHAR(255),
    names VARCHAR(255),
    usepic  VARCHAR(255)
);










INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (NULL, 35, 111, '十道前端面试题（1）', '1.call apply bind的区别，2数组去重，3.http状态码，4.css弹性布局，5.position属性有哪些值，分别有什么含义.', 'blog/jishuqu', '2019-03-20 13:19:28', 12, '0', 20, 'C#', '50', 'X_lk', 'js_01.png');
INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (2, 50, 112, '分析call,apply,bind作用', 'call,apply,bind是Function.prototype原型上的方法\r\n任何函数都可以访问call,apply,bind方法(原因:任何函数的原型链上都有Function.prototype原型)', 'blog/jishuqu', '2019-10-16 09:30:32', 15, '22', 30, 'java SE', '60', '浏阳', 'js_02.png');
INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (3, 60, 113, 'js 输入框 正则表达式（进来看菜鸟）', 'Docker 是什么？\r\nDocker 是一个开源的应用容器引擎，让开发者可以打包他们的应用以及依赖包到一个可移植的镜像中，然后发布到任何流行的 Linux 或 Windows 机器上（ 摘自百度 ）。\r\n\r\nDocker 能干什么？\r\n在讲 Docker 能干什么之前，我们不妨先看看没有 Docker 和有Docker分别是个什么样子的？\r\n\r\n先来个需求\r\n某公司需要开发一个管理系统，由于业务数据量庞大，需要对每个模块进行独立化。\r\n\r\n比如：将订单管理抽出为一个单独的系统，支付管理抽出为一个单独的系统，会员管理也抽为一个单独的系统，以此类推等等。\r\n\r\n那么，要实现用户下单支付这个逻辑，那么首先需要调用会员管理的相关接口进行登录，调用订单管理的相关借口进行下单，调用支付管理进行支付。这几个模块共同工作才构成了我们一个下单支付的功能。这就是我们常说的分布式微服务系统。\r\n————————————————\r\n版权声明：本文为CSDN博主「sunnyzyq」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\r\n原文链接：https://blog.csdn.net/sunnyzyq/article/details/101222410', 'blog/jishuqu', '2019-09-23 20:00:13', 100, '2', 362, 'javascript', '22', 'sunnyzyq', 'js_03.png');
INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (4, 700, 114, '三年一跳槽、拒绝“唯学历”，火速 Get 这份程序员求生指南！', '根据埃文斯数据公司（Evans Data Corporation）2019 最新统计的数据显示，2018 年全球共有 2300 万软件开发人员，预计到 2019 年底这个数字将达到 2640 万。但在这个庞大的数字背后，真正能配得上“软件工程师”之称的其实只有“Top 1％”。\n那么面对错综复杂的业务需求，该如何避免成为“傻瓜式”程序员？又如何在过了 35 岁之后，仍然在技术浪潮中屹立不倒？.....本文将从程序员薪资水平、技术选型、公司偏好等方面，为你详尽解读真实的程序员群体现状，以及如何“居安思危”地修炼自己，任尔东西也能岿然不动。\n\r\n————————————————\r\n版权声明：本文为CSDN博主「CSDN资讯」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\r\n原文链接：https://blog.csdn.net/csdnnews/article/details/102617768', 'blog/shenghuoqu', '2019-10-17 19:22:39', 22, '13', 2222, '非技术区', '81', '上虞', 'sh_01.png');
INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (5, 80, 115, '假如AI说谎了……', '一个程序员写了个爬虫程序，整个公司200多人被端了。”“不可能吧！”刚从朋友听到这个消息的时候，我有点不', 'blog/shenghuoqu', '2019-05-07 19:22:39', 444, '21', 224, '灌水乐园', '111', '洛奇', 'sh_02.png');
INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (6, 21, 116, '烟台氢气球母子坠亡事件：“没有良知的人，等于一无所有 ”', '早上看了一则新闻，心情久久不能平复：\r\n\r\n\r\n\r\n10月1日，在山东烟台某景区，一氢气球因绳子断裂，失控飞向空中。气球上，还有一位年轻的妈妈和她3岁的孩子。最终，气球在上升的过程中发生破裂，这对母子也从空中坠落到地面后死亡。', 'blog/shenghuoqu', '2019-05-06 19:22:39', 21, '112', 24, '非技术区', '24', '拒绝回访', 'sh_01.png');
INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (7, 12, 117, '扫黑除恶 | 最高奖励5万元！欢迎积极举报涉黑涉恶线索！', '   为进一步推动扫黑除恶专项斗争不断向纵深开展，充分调动人民群众参与扫黑除恶工作积极性，宿州市公安局埇桥分局号召广大人民群众踊跃举报和揭发各类黑恶违法犯罪线索，经查证属实的，公安机关将严格保密，最高给予50000元的奖励。\r\n\r\n\r\n举报内容有哪些\r\n\r\n\r\n\r\n        1、威胁政治安全特别是政权安全、制度安全以及向政治领域渗透的黑恶势力违法犯罪线索；\r\n\r\n        2、把持和操纵基层政权、垄断农村资源、侵吞集体资产的黑恶势力违法犯罪线索；\r\n\r\n        3、采取贿选、暴力、欺骗、威胁等手段干扰破坏农村基层换届选举的黑恶势力违法犯罪线索；\r\n\r\n        4、利用家族、宗族势力横行乡里、称霸一方、欺压残害百姓的“乡痞村霸”等黑恶势力违法犯罪线索；\r\n\r\n        5、在征地、租地、拆迁、工程项目等过程中以各种名义煽动闹事、组织策划群体上访的黑恶势力违法犯罪线索；\r\n\r\n        6、在房地产开发、建筑施工、交通运输、矿产资源、渔业捕捞、土地承包流转等行业、领域，强揽工程、强立债权、恶意竞标、非法占地、滥开滥采、强迫交易、非法垄断经营、收取“保护费”、破坏经济秩序、带车逃费等黑恶势力违法犯罪线索；', 'blog/shenghuoqu', '2018-12-03 19:22:39', 43, '2', 234, '非技术区', '87', '地方', 'sh_01.png');
INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (8, 1000, 118, '王凯在国外拍摄猎狐路透曝光，高挑身材大长腿瞩目', '演员王凯正密锣紧鼓的拍摄经侦大剧《猎狐》。近日有国外网友偶遇他在欧洲拍戏。\r\n\r\n演员王凯正密锣紧鼓的拍摄经侦大剧《猎狐》。近日有国外网友偶遇他在欧洲拍戏。\r\n\r\n演员王凯正密锣紧鼓的拍摄经侦大剧《猎狐》。近日有国外网友偶遇他在欧洲拍戏。\r\n\r\n演员王凯正密锣紧鼓的拍摄经侦大剧《猎狐》。近日有国外网友偶遇他在欧洲拍戏', 'blog/shenghuoqu', '2018-07-25 19:22:39', 33, '0', 44, '游戏区', '9', '对对对', 'sh_01.png');
INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (9, 11, 119, '南山一小区多起宠物狗中毒死亡 是消杀惹的祸还是刻意投毒？', '最近，南山区星海名城小区出现多起宠物狗中毒死亡案例，业主怀疑是管理处消杀导致，但遭到否认。目前，业主已向社区警务室反映，情况正在进一步调查中。\r\n\r\n深圳特区报2019年10月19日讯 最近，南山区星海名城小区出现多起宠物狗中毒死亡案例，业主怀疑是管理处消杀导致，但遭到否认。目前，业主已向社区警务室反映，情况正在进一步调查中。\r\n\r\n首女士是南山区星海名城小区的住户，16日晚上7点多，她牵着自家小狗在小区花园溜达几圈回来后，小狗突然口吐白沫，呕吐疼得上窜下跳很快就死亡。“就十多分钟时间，它就吐白沫，就抽搐，我就送它去医院，送到医院的时候就来不及抢救了。”首女士说，同样莫名死的还有张女士家的小狗，以及附近小区的另外几家住户的小狗。', 'blog/shenghuoqu', '2019-10-19 19:22:39', 44, '10', 87, '非技术区', '33', '发发呆', 'sh_01.png');
INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (10, 44, 120, '听说上海有一座“小故宫”，三毛一口气在这里借了10本书！| 三毛穿...', '孙绍波画（三毛形象由张乐平家人授权）\r\n\r\n　　听说上海有一座“小故宫”，“故宫我去过了，小故宫长啥样？”三毛决定去一探究竟。来到长海路366号的杨浦区图书馆新馆门口，三毛一眼认出，这不就是老早的旧上海市图书馆吗？！\r\n\r\n　　雕梁画栋、重楼飞檐，当年这幢古色古香的建筑投入使用没多久，就因战火被迫关停。80多年后，三毛漫步于此，迈过华美的孔雀门，脚下是红缸砖地坪，抬头见精致的彩绘……一切都修旧如旧、原汁原味，让三毛一时间有些恍惚：“能在那么美好的地方阅读、学习，真幸福啊！”\r\n\r\n　　虽然是临时起意来参观的，但三毛徜徉书海、细嗅书香，真想多借几本回家，但又担心不能及时归还。工作人员告诉他，杨浦区图书馆在全区设置有20多处图书网借平台，无人值守、免费配送、自助借还。“那我还担心什么！”抱着10本书，三毛满载而归。\r\n\r\n三毛', 'blog/shenghuoqu', '2019-02-14 19:22:39', 54, '1', 11, '非技术区', '11', '豆腐坊', 'sh_01.png');
INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (11, 554, 121, '外媒：在美国巨头看不到的市场，这些中企已成“巨大存在”', '​​参考消息网10月18日报道 日媒称，中美各自拥有着简称为GAFA（谷歌、亚马逊、脸书、苹果）和BATH（百度、阿里、腾讯、华为）的大型IT企业，它们均在网络广告、电子商务、云计算、智能手机领域建立自主经济圈。\r\n\r\n《日本经济新闻》网站10月17日报道，最初，BATH模仿学习GAFA。例如阿里巴巴在20年前创立之初采取的行动是创造“中国的亚马逊”。\r\n\r\n报道称，在商业的世界里，这种方式被称为“时间差经营”、“时光机经营”。在美国流行的商业模式和服务只要过去10年，肯定将在其他国家普及。因此，可以利用这一点在自己的国家和第三国展开投资，等待开花结果。\r\n\r\n中国是一个的巨大市场，效果惊人。\r\n\r\n那么，BATH是否永远都是GAFA的翻版呢？值得注意的是最近的实力和可能性。尤其是在综合金融业务领域，阿里巴巴囊括无现金支付、银行、保险和信用卡，是领先于世界的服务。这也刺激到GAFA，还在日本激发起金融科技热潮。可见BATH也进入了出口经营模式的时代。\r\n\r\n报道认为，这种革新性和实力增长还能在其他中国企业身上看到。百度向日本、欧洲的汽车厂商提供自动驾驶平台，提高话语权。腾讯在社交网站和游戏领域、华为在5G技术领域是巨大的存在。\r\n\r\n还有观点指出“BATH”这种叫法本身已经过时，中国最近的热门企业据说是TMD（字节跳动、美团点评、滴滴出行的首字母）和PKQ（拼多多、快手、趣头条的首字母）等。将这些企业的一部分与BATH的一部分组合起来的概括方式也在媒体上变得突出，可以看出中国年轻企业不断崛起的情形。\r\n\r\n报道认为，中美企业的关系或许类似于10年前的日本车和韩国现代汽车的关系。现代采取的战略是，在日本企业没有注意到的市场逐渐积蓄力量，等日本企业回过神来，现代已经逼近丰田和本田。', 'blog/shenghuoqu', '2017-01-11 19:22:39', 44, NULL, 15, '游戏区', '22', '等分', 'sh_01.png');
INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (12, 452, 122, '吴京被查箱子很多避孕套，妻子满脸尴尬，吴京淡定回答原由！', '​​吴京可以说是这几年最有名气的明星之一，不管是《战狼》，还是《流浪地球》，都取得了很高的票房，让他彻底的火了一把，', 'blog/shenghuoqu', '2018-01-13 19:22:39', 55, '0', 33, '灌水乐园', '78', '幅度', 'sh_01.png');
INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (13, 55, 123, '诺贝尔文学奖终身评委马悦然去世，生前评价批评者不懂莫言', '北京时间10月18日晚，瑞典学院官网消息显示，著名汉学家、瑞典学院院士、诺贝尔文学奖十八位终身评委之一马悦然于当地时间10月17日去世，享年95岁。随后有媒体向其家人和生前友人求证了这一消息，马悦然的夫人陈文芬表示，马悦然于10月17日在家中平静离世，“像老和尚圆寂了一样。”\r\n\r\n\r\n\r\n马悦然（Göran Malmqvist），1924年6月6日出生于瑞典南部的林雪平（Linkoping)——瑞典第五大城市，瑞典著名的“大学城”之一。1946年，马悦然进入斯德哥尔摩大学，跟随著名瑞典汉学家高本汉学习古代汉语和中国音韵学。1975年，马悦然当选瑞典皇家人文科学院院士，1985年当选为瑞典学院院士。马悦然对汉语学习有着很高的天分，他跟随汉学家高本汉学习两年中文后，便能够阅读《左传》《庄子》《诗经》。在很长时间内，马悦然是诺贝尔文学奖评委中唯一一位懂得并且精通中文的评委。', 'blog/shenghuoqu', '2019-07-19 19:22:39', 66, '22', 41, '开信区', '55', '单独', 'sh_01.png');
INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (14, 5343, 124, '《军运会开幕记》', ' 公元二〇一九，己亥年甲戌月戊子日，军运会开幕于武汉，抒文以记之。\r\n\r\n予观夫武汉之盛状，三镇欢愉，华灯满耀。两江皎平，流光返照。高桥遥布，云气横开，其势也如此。惊呼，江流已万古，月值此当空。是天亦然，则国清之必然，使吾遽躬，诚甘倾倒。时有，百姓、喧闹、玉壶相交织，皎皎照天，满城空巷，雀跃雷鸣，户户声动，此齐观开幕之大典也。举世瞩目，为当下之中华。', 'blog/shenghuoqu', '2019-08-23 19:22:39', 443, '22', 1, '开心区', '69', '后果', 'sh_01.png');
INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (15, 533, 125, '再过30天，哈尔滨就变成了雪国', '​​哈尔滨的11月，最浪漫。\r\n\r\n哈尔滨位于最北端，是中国纬度最高、气温最低的大城市。\r\n\r\n四季分明，冬季漫长寒冷，从11月开始，全国大多数地区还未降雪的时候，哈尔滨已经悄悄美成了雪国。\r\n\r\n哈尔滨的冬天，叫做雪国。\r\n\r\n洋洋洒洒的雪花仿佛唱着欢乐的歌，毫不吝啬的降临在这片土地上，你踩着大地，都会想要哼首歌\r\n\r\n哈尔滨的冬天，叫做东方莫斯科。\r\n\r\n走在大街上，你不知道哪个转角会遇见巴洛克风情的小洋楼，带你给怎样莫名的感动。', 'blog/shenghuoqu', '2019-07-12 19:22:39', 22, '22', 23, '灌水乐园', '38', '好汉歌', 'js_02.png');
INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (16, 55, 126, 'Javascript 常见的操作数组的方法', '解释：\r\narr 表示原数组；\r\nprev 表示上一次调用回调时的返回值，或者初始值 init;\r\ncur 表示当前正在处理的数组元素；\r\nindex 表示当前正在处理的数组元素的索引，若提供 init 值，则索引为0，否则索引为1；\r\ninit 表示初始值', 'blog/jishuqu', '2019-08-22 19:22:39', 2, '11', 5, 'javascript', '01', '挂号', 'js_02.png');
INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (17, 55, 127, 'git 基本配置和使用', 'git 介绍\n之前是写过关于git的一些东西的，但是都是使用的过程中遇到的问题，就简单的记录了一下，为了解决问题而写的，没有系统的写过git的东西，今天就简单的先写一下关于git的一些知识，就当是做了一个笔记吧，首先介绍一下git是什么，我们一般听到的最多的就是git是分布式项目管理工具，没有问题，它和svn的区别在于svn是一个中央集权的管理体系，而git则可以让每一台电脑都作为服务器，每一台也都可以作为客户端，所以是越多越多企业和个人的选择，git有一个总的托管平台，github.com，这个经常使用git的基本都知道，不知道它估计也没办法工作。\n\ngit下载\n直接百度git就可以，看清楚自己是mac还是liunx还是windows，不要下载错误就可以\ngit下载\n\ngit安装\ngit的安装是非常简单的，一般都是直接下一步就可以，然后如果是mac的话，可以直接下载git，也可以直接下载xcode，用mac开发的一般会装，因为这个集成了很多好用的工具，而且还是免费的，不过唯一的缺点就是文件太大了，买mac的人一般都不舍得花大价钱买硬盘和内存大一点的，因为大一点就贵很多，所以，我是直接下载了git，没有安装xcode，这个看个人喜好，这里就不做过多的解释，准备使用git的人如果安装不上，基本也就告别使用了。\n\ngit检查是不是安装成功\n我们下载好了以后怎么看是不是安装成功了呢？很简单，打开终端，直接运行git，出现下图说明是安装好了：\n\n\ngit配置本地的用户名和邮箱\n我们使用git的话，需要配置一下本地的用户名和邮箱，这样git才可以做后面的不管是本地机器还是项目的对应关系，这个配置也很简单\n\ngit config --global user.name \"用户名\"\ngit config —-global user.email “邮箱\"\n1\n2\n那么配置结束以后，我们本地会出现一个gitconfig的文件，打开里面就是我们的用户名和邮箱，说明配置好了，运行以后直接回车就可以了，不会出现提示就是最好的提示。\n\n配置git的ssh-key\n说明一下，这个不配置也是可以的，但是你每次操作远程分支的时候会让你输入账号和密码，我们做这个就是为了可以建立一个绿色通道，这样我们操作的时候就可以不用每次都输入账号和密码了，如果你的本地没有生成过ssh-key的话，那么直接运行下面的命令就可以了。\r\n————————————————\r\n版权声明：本文为CSDN博主「何处锦绣不灰堆」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\r\n原文链接：https://blog.csdn.net/qq_41485414/article/details/102480640', 'blog/jishuqu', '2019-10-01 19:22:39', 333, '55', 44, 'javascript', '26', '孤鸿寡鹄', 'js_02.png');
INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (18, 53, 128, 'ES6--Proxy', '概述\nProxy 可以对目标对象的读取、函数调用等操作进行拦截，然后进行操作处理。它不直接操作对象，而是像代理模式，通过对象的代理对象进行操作，在进行这些操作时，可以添加一些需要的额外操作。\n\n基本用法\nProxy：\n一个 Proxy 对象由两个部分组成： target 、 handler 。在通过 Proxy 构造函数生成实例对象时，需要提供这两个参数。 target 即目标对象， handler 是一个对象，声明了代理 target 的指定行为。\r\n————————————————\r\n版权声明：本文为CSDN博主「吴声子夜歌」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\r\n原文链接：https://blog.csdn.net/cold___play/article/details/102618709', 'blog/jishuqu', '2018-11-17 19:22:39', 33, '2', 112, 'javascript', '989', '刚才呢', 'js_02.png');
INSERT INTO `csdn_comment`(`tid`, `type`, `userid`, `title`, `content`, `classes`, `time`, `reading`, `star`, `collect`, `can`, `grades`, `names`, `usepic`) VALUES (null, 30, 0, 'Array数组常用方法、ES5扩展方法、ES6新增方法', '常见方法\n1.concat():连接两个或更多的数组，并返回结果\n用法：arr.concat(arr1,arr2)：结果：返回的数组元素顺序与连接的数组先后顺序一致\n\n   var a = [1,2,3];\n   var b = [4,5,6];\n   var c= [7,8,9]\n   console.log(a.concat(b))  // [1,2,3,4,5,6]\n   console.log(b.concat(c,a))  //[4,5,6,7,8,9,1,2,3]\n   console.log(a.concat(4,5); //[1,2,3,4,5]\n1\n2\n3\n4\n5\n6\n2.join() ： 将所有的元素放入一个字符串中，元素通过指定的分隔符进行分隔\n3.pop()：删除并返回数组的最后一个元素\n4.push()：向数组的末尾添加一个或更多的元素，并返回新的长度\n5.shift()：删除并返回数组的第一元素\n6.unshift()：向数组的开头添加一个或者更多的元素，并返回数组的长度\n7.reverse()：颠倒数组中的元素\n\n var b = [4,5,6];\n console.log(b.reverse()) // [6,5,4]\n console.log(b) // [6,5,4]\n1\n2\n3\n8.slice()：从某个已有的数组返回选定的元素（不改变原数组）\n9.splice()：删除元素，并向数组中添加新的元素（要改变原数组）\r\n————————————————\r\n版权声明：本文为CSDN博主「围脖上的鸽子」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\r\n原文链接：https://blog.csdn.net/qq_40099141/article/details/83504797', 'blog/jishuqu', '2019-03-15 19:22:39', 44, '0', 232, 'javascript', '2321', '会更好', 'js_02.png');

