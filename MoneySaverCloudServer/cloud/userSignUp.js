function onRequest(request, response, modules) {
    var db = modules.oData;
    db.userSignUp(
        {
            "data":{"username":request.body.username,"password":request.body.password}
        },function(err,data){         //回调函数
            response.end(data || err);
        }
    );

}

exports.userSignUp = onRequest;