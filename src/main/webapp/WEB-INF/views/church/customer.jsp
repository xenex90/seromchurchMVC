<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>YNG�� ���� �������� ȯ���մϴ�.</title>
    <link href="../css/reset5.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css"> 
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
</head>
<body>
	<div id="wrap">
		<header>
			<jsp:include page="../include/header.jsp"></jsp:include> 
			<nav>
				<ul>
					<li class="n1"><a href="company.html">ȸ��Ұ�</a></li>
					<li class="n2"><a href="product.html">��ǰ����</a></li>
					<li class="n3"><a href="community.html">Ŀ�´�Ƽ</a></li>
					<li class="n4"><a href="customer.html">������</a></li>
				</ul>
			</nav>
		</header>
   
  		<h1 id="customer"><div>customer center</div></h1>
  		<article>
  			<h2>�����Խ���</h2>
      <table id="cbbs">
      	<tr>
      		<th>��ȣ</th>
      		<th>����</th>
      		<th>�Խ���</th>
      		<th>�Խ���</th>
      		<th>��ȸ��</th>
      	</tr>
      	<tr>
      		<td>100</td>
      		<td>�� ��� �Խ����Դϴ�.</td>
      		<td>2013.05.16</td>
      		<td>ȫ�浿</td>
      		<td>125</td>
      	</tr>
  				<tr>
  					<td>100</td>
  					<td>�� ��� �Խ����Դϴ�. ������ ���ϴ�.</td>
  					<td>2013.05.16</td>
  					<td>ȫ�浿</td>
  					<td>125</td>
  				</tr>
  				<tr>
  					<td>100</td>
  					<td>�� ��� �Խ����Դϴ�. ������ �Խ��ڰ� ���մϴ�.</td>
  					<td>2013.05.16</td>
  					<td>ȫ�浿</td>
  					<td>125</td>
  				</tr>
  				<tr>
  					<td>100</td>
  					<td>�� ��� �Խ����Դϴ�.</td>
  					<td>2013.05.16</td>
  					<td>ȫ�浿</td>
  					<td>125</td>
  				</tr>
  				<tr>
  					<td>100</td>
  					<td>�� ��� �Խ����Դϴ�.</td>
  					<td>2013.05.16</td>
  					<td>ȫ�浿</td>
  					<td>125</td>
  				</tr>
  				<tr>
  					<td>100</td>
  					<td>�� ��� �Խ����Դϴ�.</td>
  					<td>2013.05.16</td>
  					<td>ȫ�浿</td>
  					<td>125</td>
  				</tr>
  				<tr>
  					<td>100</td>
  					<td>�� ��� �Խ����Դϴ�.</td>
  					<td>2013.05.16</td>
  					<td>ȫ�浿</td>
  					<td>125</td>
  				</tr>
  				<tr>
  					<td>100</td>
  					<td>�� ��� �Խ����Դϴ�.</td>
  					<td>2013.05.16</td>
  					<td>ȫ�浿</td>
  					<td>125</td>
  				</tr>
  				<tr>
  					<td>100</td>
  					<td>�� ��� �Խ����Դϴ�.</td>
  					<td>2013.05.16</td>
  					<td>ȫ�浿</td>
  					<td>125</td>
  				</tr>
  				<tr>
  					<td>100</td>
  					<td>�� ��� �Խ����Դϴ�.</td>
  					<td>2013.05.16</td>
  					<td>ȫ�浿</td>
  					<td>125</td>
  				</tr>
        </table>	
        <div id="page">
        	<ul class="paging">
        		<li><a href="#">1</a></li>
        		<li><a href="#">2</a></li>
        		<li><a href="#">3</a></li>	
        		<li><a href="#">4</a></li>
        		<li><a href="#">5</a></li>
        		<li><a href="#">6</a></li>
        	</ul>		
        </div>		
        <div class="clear"></div>
        <form id="searchbbs">
        	<input type="search"> <input type="submit" value="�˻�"> 
        </form>
        <div class="btn"><a href="#">�����ϱ�</a></div>
    		</article>


  		<aside>
  			<h3><div>����������</div></h3>
  			<ul>
  				<li><a href="#">�����Խ���</a></li>
  				<li><a href="#">��������</a></li>
  				<li><a href="#">���ο� ���� </a></li>
  			</ul>
  		</aside>


        <div class="clear"></div>
        <footer>
        	<jsp:include page="../include/footer.jsp"/>             
        </footer>
	</div>


    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="../scripts/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="../scripts/prettify.packed.js"></script>
  	<script type="text/javascript">
  		$(document).ready(function() {
			$(".fancybox").fancybox({
				openEffect	: 'none',
				closeEffect	: 'none'
			});
		});
  	</script>
</body>
</html>