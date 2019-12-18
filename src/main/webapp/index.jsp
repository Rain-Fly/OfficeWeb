<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=8">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>WebOffice演示程序</title>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
    <style type="text/css">
        <!--
        .topSide {
            border-top-width: 1px;
            border-right-width: 1px;
            border-bottom-width: 1px;
            border-left-width: 1px;
            border-top-style: solid;
            border-top-color: #3366CC;
            border-right-color: #3366CC;
            border-bottom-color: #3366CC;
            border-left-color: #3366CC;
        }
        .leftBorder {
            border-top-width: 1px;
            border-right-width: 1px;
            border-bottom-width: 1px;
            border-left-width: 1px;
            border-left-style: dashed;
            border-left-color: #0066FF;
        }
        .downSide {
            border-top-width: 1px;
            border-right-width: 1px;
            border-bottom-width: 1px;
            border-left-width: 1px;
            border-bottom-style: dashed;
            border-bottom-color: #0066FF;
        }
        .STYLE1 {color: #FF0000}
        -->
    </style>
    <!-- --------------------=== 调用Weboffice初始化方法 ===--------------------- -->
    <SCRIPT LANGUAGE=javascript FOR=WebOffice1 EVENT=NotifyCtrlReady>
        // 在装载完Weboffice(执行&lt;object>...&lt;/object>)控件后执行 "WebOffice1_NotifyCtrlReady"方法
        // WebOffice1_NotifyCtrlReady();
    </SCRIPT>

    <SCRIPT LANGUAGE=javascript>
        <!--
        // ---------------------=== 控件初始化WebOffice方法 ===---------------------- //
        function WebOffice1_NotifyCtrlReady() {
            document.all.WebOffice1.LoadOriginalFile("", "doc");
        }



        function DownLoadFile() {

            //直接打开
            //document.all.WebOffice1.LoadOriginalFile("http://localhost:8082/demo/image/tmp1.doc", "doc");
            //缓存到本地
            document.all.WebOffice1.DownLoadFile("http://192.168.1.200:8082/demo/image/tmp1.doc","E:\\test.doc","","");
            //然后执行一个打开脚本
            document.all.WebOffice1.LoadOriginalFile("E:\\test.doc", "doc");
        }

        function saveFile() {

            // document.all.WebOffice1.Save();

            var returnValue;					// 保存页面的返回值
            document.all.WebOffice1.HttpInit();	// 初始化Http引擎
            // 添加相应的Post元素
            document.all.WebOffice1.HttpAddPostString("username", "test");
            // 添加上传文件
            document.all.WebOffice1.HttpAddPostCurrFile("AipFile ","");
            // 提交上传文件
            returnValue = document.all.WebOffice1.HttpPost("http://192.168.1.200:8082/common/attachment/officeSync.kcppc");
            console.log(returnValue);
            if("true" == returnValue){
                alert("文件上传成功");
            } else  {
                alert("文件上传失败")
            }
        }

        //-->
    </SCRIPT>
</head>

<body>
<div>
    <button name="button32" type="button"  onclick="return DownLoadFile()" >打开</button>
    <button name="button32" type="button"  onclick="return saveFile()" >保存</button>
</div>
<!-- -----------------------------== 装载weboffice控件 ==--------------------------------- -->
<script src="LoadWebOffice.js"></script>
<!-- --------------------------------== 结束装载控件 ==----------------------------------- -->
</body>
</html>
