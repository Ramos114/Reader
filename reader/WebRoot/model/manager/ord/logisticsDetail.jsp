<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>物流详情</title>
  </head>
  
  <body>
  <div class="wrapper-md">
	<div class="panel panel-default">
		<div class="panel-heading"><h4>包裹运送信息</h4></div>
		
   <div class="wrapper">
   
      <ul class="timeline">
      <li class="tl-header">
          <div class="btn btn-icon btn-rounded btn-default"><i class="fa fa-twitter"></i></div>
        </li>
        <li class="tl-item">
          <div class="tl-wrap">
            <div class="tl-content">
           2016-11-14&nbsp;&nbsp;&nbsp;16:59&nbsp;&nbsp;泉州市|收件|泉州【晋江安海二部】，【爱乡亲/17750898666】已揽收
            </div>
          </div>
        </li>
        <li class="tl-item">
          <div class="tl-wrap">
            <div class="tl-content">
            2016-11-14&nbsp;&nbsp;&nbsp;20:41&nbsp;&nbsp;泉州市|到件|到泉州【泉州转运中心】
            </div>
          </div>
        </li>
        <li class="tl-item">
          <div class="tl-wrap">
            <div class="tl-content">
           2016-11-14&nbsp;&nbsp;&nbsp;22:47&nbsp;&nbsp;泉州市|发件|泉州【泉州转运中心】，正发【虎门转运中心】
            </div>
          </div>
        </li>
        <li class="tl-item">
          <div class="tl-wrap">
            <div class="tl-content">
             2016-11-15&nbsp;&nbsp;&nbsp;13:23&nbsp;&nbsp;	东莞市|到件|到东莞【虎门转运中心】
            </div>
          </div>
        </li>
        <li class="tl-item">
          <div class="tl-wrap">
            <div class="tl-content">
            2016-11-15&nbsp;&nbsp;&nbsp;13:38&nbsp;&nbsp;东莞市|发件|东莞【虎门转运中心】，正发【东莞寮步百业分部】
            </div>
          </div>
        </li>
        <li class="tl-item">
          <div class="tl-wrap">
            <div class="tl-content">
             2016-11-15&nbsp;&nbsp;&nbsp;17:20&nbsp;&nbsp;东莞市|到件|到东莞【东莞寮步百业分部】
            </div>
          </div>
        </li>
        <li class="tl-item">
          <div class="tl-wrap">
            <div class="tl-content">
            2016-11-16&nbsp;&nbsp;&nbsp;01:36&nbsp;&nbsp;东莞市|派件|东莞【东莞寮步百业分部】，【刘海洋/13377781618】正在派件
            </div>
          </div>
        </li>
        <li class="tl-item">
          <div class="tl-wrap">
            <div class="tl-content">
             2016-11-16&nbsp;&nbsp;&nbsp;14:16&nbsp;&nbsp;东莞市|签收|东莞【东莞寮步百业分部】，城院速来宝百世代理点代签收13377781618 已签收
            </div>
          </div>
        </li>
      <!--   <li class="tl-item">
          <div class="tl-wrap">
            <div class="tl-content">
             2016-12-7&nbsp;&nbsp;&nbsp;11:20&nbsp;&nbsp;【东莞市】送货完毕，感谢使用顺丰快递
            </div>
          </div>
        </li> -->
        <li class="tl-header">
          <div class="btn btn-icon btn-rounded btn-default"><i class="fa fa-twitter"></i></div>
        </li>
   </ul>
   <hr/>
   <table>
   <tr>
   <th style="width:1%">运单号：70078909609141</th><th style="width:1%">物流号：70078909609141</th><th style="width:1%">物流公司：百世快递</th>
   </tr>
   <tr><th style="width:1%">发货地址：泉州市晋江安海二部</th><th style="width:1%">收货地址：广东省东莞市寮步镇城市学院</th></tr>
   
   </table>
   <hr/>
   <div align="center">
   <button class="btn btn-sm btn-success btn-addon"
							onclick="toSkit('${basePath }${pageContext.request.contextPath}/model/manager/ord/orderManage.jsp')">
							<i class="fa fa-mail-reply"></i>返回
						</button>
				</div>	
    </div>
    </div>
   </div>
  </body>
</html>
