const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const session = require("express-session"); 
const multer = require('multer')
const fs = require('fs')
//3:创建数据库连接池(池 提高效率)
var pool = mysql.createPool({
    host:"127.0.0.1", //数据库地址
    user:"root",      //数据库用户名
    password:"",      //数据库密码
    port:3306,      //数据库端口
    database:"csdn",//库名
    connectionLimit:15//15连接
})
//4:配置跨域模块
//  允许哪个程序跨域访问服务器
//  脚手架:3001 允许3001访问我
//  服务器:4000 你
var server = express();

var createFolder = function(floder){
  try{
    fs.accessSync(folder)
  }catch(e){
    fs.mkdirSync(folder)
  }
}
var uploadFolder = './public/userAvatar';
var storage = multer.diskStorage({
  destination:function(req,file,cb){
    cb(null,uploadFolder)
  },
  filename:function(req,file,cb){
    var idx = file.originalname.lastIndexOf('.');
    var suff = file.originalname.substring(idx);
    cb(null,file.originalname)
  }
})
var  upload = multer({storage:storage})


server.use(cors({
  //允许程序列表
  origin:["http://localhost:8080","http://127.0.0.1:8080"],
  credentials:true//每次请求需要验证
}))
//5:配置session模块?????????
server.use(session({
   secret:"128位字符串",//安全字符串
   resave:true,//请求时更新数据
   saveUninitialized:true//保存初始数据
}))
//6:配置项目静态目录 public
server.use(express.static("./public"))
//7:创建express对象绑定4000端口
server.listen(4000);

server.get("/login",(req,res)=>{
  var uname = req.query.uname;
  var upwd = req.query.upwd;
  var sql = "SELECT * FROM csdn_user WHERE uname=? AND upwd =?";
  pool.query(sql,[uname,upwd],(err,result)=>{
    if(err)throw err;
    if(result.length>0){
      req.session.uid = result[0].uid
      // console.log(req.session.uid)
      // console.log(result)
      res.send({code:1,msg:result})
    }else{
      res.send({code:-1,msg:"用户名或密码错误"})
    }
  })
})
server.get('/usermsg',(req,res)=>{
  var uid = req.session.uid;
  if(!uid){res.send({code:-1,msg:"用户未登录"});return}
  var sql = "SELECT * FROM csdn_user WHERE uid=:"
  pool.query(sql,[uid],(err,result)=>{
    if(err)throw err;
    if(result.length>0){
      res.send({code:1,msg:result})
    }
  })
});
server.get('/text',(req,res)=>{
  var uid = req.session.uid;
  if(!uid){res.send({code:-1,msg:"用户未登录"});return}
  var type = req.query.type;
  var sql = "SELECT * FROM csdn_text WHERE userid=? and type=?"
  pool.query(sql,[uid,type],(err,result)=>{
    if(err)throw err;
    if(result.length>0){
      res.send({code:1,msg:result})
    }else{
      res.send({code:0,msg:"获取失败"})
    }
  })
});
server.get('/follow',(req,res)=>{
  var uid = req.session.uid;
  if(!uid){res.send({code:-1,msg:"用户未登录"});return}
  var sql = "SELECT * FROM csdn_follow WHERE userid=?"
  pool.query(sql,[uid],(err,result)=>{
    if(err)throw err;
    if(result.length>0){
      res.send({code:1,msg:result})
    }else{
      res.send({code:0,msg:"获取失败"})
    }
  })
});

server.get('/update',(req,res)=>{
  var uid = req.session.uid;
  if(!uid){res.send({code:-1,msg:"用户未登录"});return}
  var username = req.query.username;
  var sign = req.query.sign;
  var school = req.query.school;
  var company = req.query.company;
  var sql = "UPDATE  csdn_user SET username=?,sign=?,school=?,company=? WHERE uid=:"
  pool.query(sql,[username,sign,school,company,uid],(err,result)=>{
    if(err)throw err;
    // console.log(result)
    if(result.affectedRows>0){
      res.send({code:1,msg:result})
    }
  })
})
server.get('/reg',(req,res)=>{
  var obj = req.query;
  var uname = req.query.uname;
  var upwd = req.query.upwd;
  var sql1 = 'SELECT * FROM csdn_user WHERE uname=?'
  pool.query(sql1,[uname],(err,result)=>{
    if(err)throw err;
    if(result.length>0){
      res.send({code:-1,msg:"用户名已存在"})
    }else{
      var sql2 = 'INSERT INTO csdn_user SET ?';
      pool.query(sql2,[obj],(err,result)=>{
        if(err)throw err;
        if(result.affectedRows>0){
          res.send({code:1,msg:"注册成功"})
        }else{
          res.send({code:0,msg:"注册失败"})
        }
      })
    }
  }) 
})


server.post('/avatar',upload.single('logo'),(req,res,next)=>{
  var uid = req.session.uid;
  if(!uid){res.send({code:-1,msg:"用户未登录"});return}
  var url = 'http://' + req.headers.host + '/userAvatar/' + req.file.originalname;
  // console.log(url);
  // console.log(req.file.originalname)
  var sql ="UPDATE csdn_user SET headpic=? WHERE uid=?"
  pool.query(sql,[url,uid],(err,result)=>{
    if(err)throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:url})
    }else{
      res.send({code:0,msg:"修改失败"})
    }
  })
});

server.get("/getcom",(req,res)=>{
  var uid = req.session.uid;
  if(!uid){res.send({code:-1,msg:"用户未登录"});return}
  var tid = req.query.tid
  var sql = 'SELECT * FROM csdn_discuss WHERE tid=?'
  pool.query(sql,[tid],(err,result)=>{
    if(err)throw err;
    if(result.length>0){
      res.send({code:1,msg:result})
    }else{
      res.send({code:0,msg:"暂无评论"})
    }
  })
})
server.get("/addcom",(req,res)=>{
  var uid = req.session.uid;
  if(!uid){res.send({code:-1,msg:"用户未登录"});return}
  var obj = req.query;
  var sql = "INSERT INTO csdn_discuss SET ?";
  pool.query(sql,[obj],(err,result)=>{
    if(err)throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"添加成功"})
    }else{
      res.send({code:1,msg:"添加失败"})
    }
  })
})

server.get("/bye",(req,res)=>{
  req.session.uid = null;
  res.send({code:1,msg:"退出成功"})
})

server.get("/class",(req,res)=>{
  var uid = req.session.uid;
  if(!uid){res.send({code:-1,msg:"用户未登录"});return}
  var sql = "SELECT classes from csdn_follow WHERE userid=?"
  pool.query(sql,[uid],(err,result)=>{
    if(err)throw err;
    if(result.length>0){
      res.send({code:1,msg:result})
    }else{
      res.send({code:0,msg:"获取失败"})
    }
  })
})
server.get("/updateclasses",(req,res)=>{
  var uid = req.session.uid;
  if(!uid){res.send({code:-1,msg:"用户未登录"});return}
  var  classes = req.query.classes
  var  sql ="UPDATE csdn_follow SET classes=? WHERE userid=?"
  pool.query(sql,[classes,uid],(err,result)=>{
    if(err)throw err;
    if(result.affectedRows>0){
      console.log(result)
      res.send("1")
    }else{
      res.send("-1")
    }
  })
})
/**
 * 
 * 
 * 
 * 
 * 
 * 
 *  */ 
server.get('/v1/text',(req,res)=>{
  var pno=req.query.pno;
  var ps=req.query.pageSize;
  var concern = req.query.follower;
  console.log(concern);
  var classes =req.query.classes;
  console.log(classes)
  if(!pno){pno=1};
  if(!ps){ps=10};
  
  var off=(pno-1)*ps;
  ps=parseInt(ps);
  var arr = [off,ps];
  var  sql = "SELECT * FROM csdn_text WHERE type=10 LIMIT ?,?"
  if(concern){
    var tj = concern;
    arr.unshift(tj)
    sql="select * FROM csdn_text WHERE type=10 AND userid in (?) limit ?,?";
  }
  if(classes){
    var tj = classes;
    arr.unshift(tj)
    sql ="SELECT * FROM csdn_text WHERE type=10 AND classes=? limit ?,?"
  }
  console.log(arr);
  pool.query(sql,arr,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      console.log(result);
      res.send({msg:1,data:result});
    }else{
      res.send({msg:0,data:"查询失败"});
    }
  })
});
server.get('/v1/usertext',(req,res)=>{
  var tid=req.query.tid;
  var sql="select * FROM csdn_text WHERE tid=?";
  pool.query(sql,[tid],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
});
server.get('/v1/user',(req,res)=>{
  // var uid = req.session.uid;
  // if(!uid){res.send({code:-1,msg:"用户未登录"});return}
  var userid=req.query.userid;
  //console.log(uid)
  if(userid.length>1){
    // var data=[];
    // for(var i=0;i<uid.length;i++){
      var sql=`select headpic,username,uid from csdn_user where uid in (${userid})`;
      pool.query(sql,(err,result)=>{
        if(err) throw err;
        //console.log(result)
        //data=data.concat(result);
        // if(i==uid.length-2){console.log(data);res.send(data)};
        //console.log(data);
        //res.send(data);
        //console.log(result);
      //}) 
        res.send(result);
      })
  }else{
    var sql="select*from csdn_user where uid=?";
    pool.query(sql,[userid],(err,result)=>{
      if(err) throw err;
      res.send(result);
    })
  }
});
server.get("/v1/follow",(req,res)=>{
  var userid=req.session.uid;
  if(!userid){res.send({code:-1,msg:"用户未登录"});return}
  //console.log(userid);
  var sql="select fid,follower from csdn_follow where userid=?";
  pool.query(sql,[userid],(err,result)=>{
    if(err) throw err;
    res.send(result);
    
  })
});
server.get('/v1/update',(req,res)=>{
  var follower=req.query.fl;
  var userid=req.session.uid;
  if(!userid){res.send({code:-1,msg:"用户未登录"});return}
  var sql='update csdn_follow set follower=? where userid=?';
  pool.query(sql,[follower,userid],(err,result)=>{
    if(err) throw err;
    res.send("1");
  })
});
server.get('/v1/update2',(req,res)=>{
  var star=req.query.star;
  var tid=req.query.tid;
  var sql='update csdn_text set star=? where tid=?'
  pool.query(sql,[star,tid],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
});
server.get('/v1/pl',(req,res)=>{
  var textid=req.query.tid;
  var userid=req.session.uid;
  if(!userid){res.send({code:-1,msg:"用户未登录"});return}
  var sql="select did,userid,content,time from csdn_discuss where textid=?";
  pool.query(sql,[textid],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
});
server.get('/v1/pl2',(req,res)=>{
  var obj=req.query;
  var userid=req.session.uid;
  if(!userid){res.send({code:-1,msg:"用户未登录"});return}
  obj.userid=userid;
  var sql="insert into csdn_discuss set ?";
  pool.query(sql,[obj],(err,result)=>{
    if(err) throw err;
    res.send("1")
  })
});
server.get('/v1/seach',(req,res)=>{
  var cont=req.query.cont;
  console.log(cont);
  if(cont==''){
    console.log(1);
    return;
  }
  var sql=`select*from csdn_text where content like '%${cont}%'`;
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    //console.log(result);
    res.send(result);
  })
})
/***
 * 
 * 
 * 
 * 
 *  */
//查询电子书列表
server.get("/v2/study",(req,res)=>{
  var sql = "SELECT * FROM csdn_books";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

server.get("/v2/details",(req,res)=>{
var bid = req.query.bid;
// console.log(bid);
var sql = "SELECT * FROM csdn_books WHERE bid=?";
pool.query(sql,[bid],(err,result)=>{
  if(err) throw err;
  res.send(result);
  // console.log(result);
})
})
server.get("/addbooks",(req,res)=>{
  var uid = req.session.uid;
  if(!uid){res.send({code:-1,msg:"用户未登录"});return}
  var bid = req.query.bid
  var sql = "SELECT books FROM csdn_follow WHERE userid=?"
  pool.query(sql,[uid],(err,result)=>{
    if(err)throw err;
    if(result.length>0){
      console.log(result)
      if(result[0].books.indexof(bid)==-1){
        result[0].books+=`,${bid}`
      }else{
        res.send({code:-1,msg:"书架中已存在"})
        return
      }
      var sql = 'UPDATE csdn_follow SET books=? WHERE uid=?'
      pool.query(sql,[result[0].bbooks,uid],(err,result)=>{
        if(err)throw err;
        if(result.affectedRows>0){
          res.send({code:1,msg:"添加成功"})
        }else{
          res.send({code:0,msg:"添加失败"})
        }
      })
    }else{
      var sql = "INSERT INTO csdn_follow SET userid=?,books=?"
      pool.query(sql,[uid,bid],(err,result)=>{
        if(err)throw err;
        if(result.affectedRows>0){res.send({code:1,msg:"添加成功"})}
        else{res.send({code:0,msg:"添加失败"})}
      })
    }   
  })
})

/**
 * 
 * 
 * 
 * 
 * 
 */
server.get('/v4/jishuqu',(req,res)=>{
  var classes=req.query.classes;
  var sql="SELECT * FROM csdn_comment WHERE classes='blog/jishuqu'";
  pool.query(sql,[classes],(err,result)=>{
    if(err)throw err;
    res.send({code:1,msg:"查询成功",data:result})
  })
})
server.get('/v4/shenghuoqu',(req,res)=>{
  var classes=req.query.classes;
  var sql="SELECT * FROM csdn_comment WHERE classes='blog/shenghuoqu'";
  pool.query(sql,[classes],(err,result)=>{
    if(err)throw err;
    res.send({code:1,msg:"查询成功",data:result})
  })
})
server.get('/v4/lq',(req,res)=>{
  var tid=req.query.tid;
  var sql="SELECT * FROM csdn_comment WHERE tid =?";
  pool.query(sql,[tid],(err,result)=>{
    if(err)throw err;
    res.send({code:1,msg:"查询成功",data:result})
  })
  
})