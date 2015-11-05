var tool = require("bmobcloud-local");

//请根据自己的情况修改application_id和rest_key信息
var options = require("../AppConfig.json");

tool.initialize(options.app_key, options.rest_key);

function local() {
    var userLogin = require("../cloud/userLogin").userLogin;
    tool.test(userLogin, {"username": "vfanx","password":"666666"});
}

function server() {
    var path = require("path");
//调用first.js云端代码（带上传参数）
    tool.testInServer(path.resolve(__dirname, "../cloud/userLogin"), {"username": "vfanx","password":"666666"});
}


funcTest();


//local();
//server();