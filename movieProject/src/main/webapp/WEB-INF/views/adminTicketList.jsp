<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <link rel="stylesheet"  href="${path}/resources/css/main.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${path}/resources/js/main.min.js"></script>
 	<style>

  body {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #script-warning {
    display: none;
    background: #eee;
    border-bottom: 1px solid #ddd;
    padding: 0 10px;
    line-height: 40px;
    text-align: center;
    font-weight: bold;
    font-size: 12px;
    color: red;
  }

  #loading {
    display: none;
    position: absolute;
    top: 10px;
    right: 10px;
  }

  #calendar {
    max-width: 1100px;
    margin: 40px auto;
    padding: 0 10px;
  }
  </style>
  
  <script>

    $(document).ready(function() {
        var calendarEl = document.getElementById('calendar');
        
        var calendar = new FullCalendar.Calendar(calendarEl, {
          displayEventTime: true,
          selectable: true,
          selectMirror: true,
          timeZone:'UTC',
          navLinks: true,

          
          dateClick: function(info) {
              alert('clicked ' + info.dateStr);
            },

          select: function(arg) {
				console.log(arg);

              },  

          headerToolbar: {
            left: 'prevYear,prev,next,nextYear today',
            center: 'title',
            right: 'dayGridMonth,timeGridDay,listYear'
          },
          events: {
            url: 'ics/feed.ics',
            format: 'ics',
            failure: function() {
              document.getElementById('script-warning').style.display = 'block';
            }
          },
          loading: function(bool) {
            document.getElementById('loading').style.display =
              bool ? 'block' : 'none';
          },
          events: 'https://fullcalendar.io/demo-events.json'
        });

        calendar.render();
      });

    </script>
  
  	<title>예매내역</title>
  </head>
  <body>
  <header>
	<jsp:include page="/WEB-INF/views/adminHeader.jsp" />
	</header>
	
	
    <div id='calendar' style="margin-top:100px; margin-bottom:120px;"></div>
    
    <div id='script-warning'>
    	<code>ics/feed.ics</code> must be servable
  	</div>

  	<div id='loading'>loading...</div>

	<div>
		<div style="height:30px; text-align:center; font-size:35px; margin-bottom:30px;">예매현황</div>

  		<div id='calendar'></div>
  	</div>
    
    
    <footer>
    	<jsp:include page="/WEB-INF/views/footer.jsp" />
	</footer>
  </body>
</html>