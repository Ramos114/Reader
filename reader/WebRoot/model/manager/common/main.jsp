<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    
    <title>电商管理系统</title>
    
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="renderer" content="webkit">
    
    <title> -欢迎 </title>
    <%@ include file="/model/manager/common/common_style.jsp"%>

  </head>
  
  <body>
  	<div class="app app-header-fixed" id="app">
  		<!-- 导入顶栏 -->
  		<%@ include file="/model/manager/common/navbar.jsp"%>
  		
  		<!-- 导入左边树形菜单 -->
  		<%@ include file="/model/manager/common/sidebar.jsp"%>
  		
  		<!-- content -->
  		<div class="app-content ng-scope">
      	 <div ui-butterbar></div>
      	  <a href class="off-screen-toggle hide" data-toggle="class:off-screen" data-target=".app-aside" ></a>
      	    <!-- 中间待切换相应模块div -->
      	    <div id="content_load" class="app-content-body fade-in-up"></div>
    	</div>
    	<!-- /content -->
    	
  	</div>
  	
  <%@ include file="/model/manager/common/common_js.jsp"%>
  <script type="text/javascript">
    +function ($) {
      $(function(){
        // class
        $(document).on('click', '[data-toggle^="class"]', function(e){
          e && e.preventDefault();
          console.log('abc');
          var $this = $(e.target), $class , $target, $tmp, $classes, $targets;
          !$this.data('toggle') && ($this = $this.closest('[data-toggle^="class"]'));
          $class = $this.data()['toggle'];
          $target = $this.data('target') || $this.attr('href');
          $class && ($tmp = $class.split(':')[1]) && ($classes = $tmp.split(','));
          $target && ($targets = $target.split(','));
          $classes && $classes.length && $.each($targets, function( index, value ) {
            if ( $classes[index].indexOf( '*' ) !== -1 ) {
              var patt = new RegExp( '\\s' + 
                  $classes[index].
                    replace( /\*/g, '[A-Za-z0-9-_]+' ).
                    split( ' ' ).
                    join( '\\s|\\s' ) + 
                  '\\s', 'g' );
              $($this).each( function ( i, it ) {
                var cn = ' ' + it.className + ' ';
                while ( patt.test( cn ) ) {
                  cn = cn.replace( patt, ' ' );
                }
                it.className = $.trim( cn );
              });
            }
            ($targets[index] !='#') && $($targets[index]).toggleClass($classes[index]) || $this.toggleClass($classes[index]);
          });
          $this.toggleClass('active');
        });

        // collapse nav
        $(document).on('click', 'nav a', function (e) {
          var $this = $(e.target), $active;
          $this.is('a') || ($this = $this.closest('a'));
          
          $active = $this.parent().siblings( ".active" );
          $active && $active.toggleClass('active').find('> ul:visible').slideUp(200);
          
          ($this.parent().hasClass('active') && $this.next().slideUp(200)) || $this.next().slideDown(200);
          $this.parent().toggleClass('active');
          
          $this.next().is('ul') && e.preventDefault();

          setTimeout(function(){ $(document).trigger('updateNav'); }, 300);      
        });
      });
      
      
      //切换相应模块div
      $(".content_Item").click(function(){
      	  var url = $(this).attr("id");
      	  $("#content_load").load(url);
      });
      
    }(jQuery);
    
    
    //跳转方法
    function toSkit(url){
      	$("#content_load").load(url);
   }
  </script>
  </body>
</html>
