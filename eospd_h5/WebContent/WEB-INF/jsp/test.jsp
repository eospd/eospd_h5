<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>日期选择</title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link href="css/jquery-ui.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-datepicker3.min.css">
</head>
 <body>
    <div class="container">
        <div class="row">
           <div id="datepicker" class="date col-md-2 col-xs-4 input-group" style="padding-top: 300px">
               <input type="text" class="form-control input-sm" placeholder="点击选择时间"/>
                <span class="input-group-addon">  
                   <i class="glyphicon glyphicon-th-list"></i>
                </span>
           </div>
           
           <div class="input-group input-daterange">
											<input type="text" class="form-control" value="2012-04-05">
											<span class="input-group-addon">到</span> <input type="text"
												class="form-control" value="2012-04-19">
			</div>
        </div>
    </div>
    <!--<a href="https://www.baidu.com/s?wd=js&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1YdrjF9uHubnHRzuHDYnyDv0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6K1TL0qnfK1TL0z5HD0IgF_5y9YIZ0lQzqlpA-bmyt8mh7GuZR8mvqVQL7dugPYpyq8Q1Dvn16vPWRzPHfLPHTdPH0Lrj0" target="_blank" class="baidu-highlight">js</a>-->
  
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-datepicker.zh-CN.min.js"></script>
    <script type="text/javascript">  
        $('#datepicker').datepicker({
            show: true,  
            format: 'yyyy-mm-dd',
            language: 'zh-CN',  
            weekStart: 1,
            autoclose: true,
            orientation:'right',
            todayBtn:'linked'
            
          });
	    $('.input-daterange input').each(function() {
	        $(this).datepicker({language: 'zh-CN',autoclose:true} );
	    });
     </script>
 </body>
 </html>