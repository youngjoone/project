<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/main.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
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

//    $(document).ready(function() {
document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        
        var calendar = new FullCalendar.Calendar(calendarEl, {
          displayEventTime: true,
          selectMirror: true,
          timeZone:'UTC',
          navLinks: true,
          locale:"ko",

          navLinkDayClick: function(date, jsEvent) {
        	    console.log('day', date.toISOString());
        	    console.log('coords', jsEvent.pageX, jsEvent.pageY);
        	  }
          
          dateClick: function(info) {
              //alert('clicked ' + info.dateStr);
              $.ajax({
                url: 'list/chk',
                type: 'GET',
                success: function(res){
                   console.log(res  + ':' + typeof(res));
                   
                   
                    var calendarEl = document.getElementById('calendar');

                   alert("isArray = " + Array.isArray(res));
                   var events = res.map(function(item) {
                      return {
                         title : item.ticketNo,
                         start : item.tDate + "T" + item.tTime
                     }
                   });
                   
                  var calendar = new FullCalendar.Calendar(calendarEl, {
                     events : events,
                     eventTimeFormat: { // like '14:30:00'
                         hour: '2-digit',
                         minute: '2-digit',
                         hour12: false
                       }
                  });
                  calendar.render();
                }// end success

                
             })//end ajax
            },

          select: function(arg) {
            console.log(arg);
            var title = prompt("Event Title:");
            if(title) {
               calendar.addEvent({
                  title: title,
                  start: arg.start,
                  end: arg.end,
                  allDay:arg.allDay
                  })

               }
               calendar.unselect()
              },  

          headerToolbar: {
            left: 'prevYear,prev,next,nextYear today',
            center: 'title',
            right: 'dayGridMonth,listDay'
          },
          
          events: [
             
         
         ]
              
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


   <div style="height:30px; text-align:center; font-size:35px; margin-bottom:30px;">예매현황</div>
   <div>
      

        <div id='calendar'></div>
     </div>
    
    
    <footer>
       <jsp:include page="/WEB-INF/views/footer.jsp" />
   </footer>
  </body>
</html>