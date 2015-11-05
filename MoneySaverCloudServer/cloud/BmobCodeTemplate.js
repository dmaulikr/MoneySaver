// fucName 为回调函数名
function onRequest(request, response, modules) {
    var db = modules.oData;
    db.funcName(
        {

        },function(err,data){

            var dataObject = JSON.parse(data);
            var errObject  = JSON.parse(err);
            var resultRespond = {};

            resultRespond.errCode = err ? (errObject.code) : (dataObject.code || 200);

            if (resultRespond.errCode === 200){
                delete dataObject.createdAt;
                delete dataObject.updatedAt;
                resultRespond.result = dataObject;
                resultRespond.errMsg = "";
                response.end(JSON.stringify(resultRespond));
            } else
            {
                resultRespond.errMsg = err ? errObject.message : (dataObject.error || "UnKnow Error");
                resultRespond.result = "";
                response.end(JSON.stringify(resultRespond));
            }
        }
    );
}

exports.funcName = onRequest;