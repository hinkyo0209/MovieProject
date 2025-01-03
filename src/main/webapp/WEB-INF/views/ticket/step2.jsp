<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

$(document).ready(function() {
    let isRequestInProgress = false; // 요청 진행 상태 플래그

    //--------------------인원선택 시작--------------------
    $('.number_plus').click(function(){ 
        var t = $('.number_plus').index(this);
        var currentCount = parseInt($(".txt:eq("+t+")").val()) || 0; // 현재 인원수
        var totalCount = getTotalCount(); // 현재 총합
        
        // 총합이 2명 이상일 경우 경고 메시지
        if (totalCount >= 2) {
            alert('인원 선택은 총 2명까지 가능합니다.');
            return; // 추가 증가하지 않게
        }

        // 현재 인원 수 증가
        $(".txt:eq("+t+")").val(currentCount + 1); // 1 증가
        updateTotal(); // 총합 업데이트
        
        // 최대 선택 가능한 좌석 수 업데이트
        updateMaxSelectableSeats();
    });
    
    $('.number_minus').click(function(){ 
        var t = $('.number_minus').index(this);
        var currentCount = parseInt($(".txt:eq("+t+")").val()) || 0; // 현재 인원수
        if (currentCount > 0) {
            $(".txt:eq("+t+")").val(currentCount - 1); // 1 감소
            updateTotal(); // 총합 업데이트
            
            // 최대 선택 가능한 좌석 수 업데이트
            updateMaxSelectableSeats();
        }
    });

    // 각 인원 수가 변경될 때마다 호출되는 함수
    function updateTotal() {
        var adultCount = parseInt($(".txt:eq(0)").val()) || 0;
        var minorCount = parseInt($(".txt:eq(1)").val()) || 0;
        var elderlyCount = parseInt($(".txt:eq(2)").val()) || 0;
        var disabledCount = parseInt($(".txt:eq(3)").val()) || 0;
        
        // 총합 계산
        var totalCount = adultCount + minorCount + elderlyCount + disabledCount;
        
        // 총합 업데이트
        $("#total-Adult").text(adultCount);
        $("#total-Minor").text(minorCount);
        $("#total-Elderly").text(elderlyCount);
        $("#total-Disabled").text(disabledCount);        
    }
   
    // 총합 계산 함수
    function getTotalCount() {
        return (
            (parseInt($(".txt:eq(0)").val()) || 0) +
            (parseInt($(".txt:eq(1)").val()) || 0) +
            (parseInt($(".txt:eq(2)").val()) || 0) +
            (parseInt($(".txt:eq(3)").val()) || 0)
        );
    }
    
    // 페이지 로드 시 총합 초기화
    updateTotal();
    //--------------------인원선택 끝--------------------

    //--------------------좌석선택 시작--------------------
    
    function updateSelectedSeats() {
        const selectedSeats = $('.selected').map(function() {
            return $(this).data('index');
        }).get();
        $('#selectedSeats').text(selectedSeats.join(', '));
    }
    //--------------------좌석선택 끝--------------------
    
    // AJAX 요청을 통해 step3로 데이터 전송
    $("#nextButton").off("click").on("click", function() {
        if (isRequestInProgress) return; // 요청이 진행 중이면 아무것도 하지 않음
        isRequestInProgress = true; // 요청 시작
        
        console.log("다음 버튼 클릭됨"); // 로그 추가
    
        const selectedSeats = $('#selectedSeats').text(); // 선택된 좌석
        const adultCount = parseInt($("input[name='adultCount']").val()) || 0;
        const minorCount = parseInt($("input[name='minorCount']").val()) || 0;
        const elderlyCount = parseInt($("input[name='elderlyCount']").val()) || 0;
        const disabledCount = parseInt($("input[name='disabledCount']").val()) || 0;
        
        // 영화 정보 추가
        const movieCover = '${mItem.moviecover}'; // 영화 표지
        const gradeImage = '${mItem.gradeimage}'; // 등급 이미지
        const movieTitle = '${mItem.movietitle}'; // 영화 제목
        
        // 상영 정보 추가
        const screeningTheater = '${sItem.screening_theater}'; // 상영관
        const screeningDate = '${sItem.screening_date}'; // 상영일
        const screeningTime = '${sItem.screening_time}'; // 상영시간
        
        //선택된 좌석이 없을 경우 경고 메시지
        if(!selectedSeats){
           alert('선택된 좌석이 없습니다. 좌석을 선택해주세요.')
           isRequestInProgress = false; // 요청 완료 상태로 변경
           return; //조건이 충족되지 않으면 진행하지 않음
        }
    
        // 총합 계산
        const totalCount = adultCount + minorCount + elderlyCount + disabledCount;
        const selectedCount = $('.selected').length; // 선택된 좌석 수
    
        // 총합과 선택된 좌석 수 비교
        if (totalCount !== selectedCount) {
            alert('인원 수와 선택된 좌석 수가 일치하지 않습니다.');
            isRequestInProgress = false; // 요청 완료 상태로 변경
            return; // 조건이 충족되지 않으면 진행하지 않음
        }
    
        // 로그 출력
        console.log("AJAX 요청 데이터:", JSON.stringify({
            step2_selectedSeats: selectedSeats,
            step2_adultCount: adultCount,
            step2_minorCount: minorCount,
            step2_elderlyCount: elderlyCount,
            step2_disabledCount: disabledCount,
            step2_movieCover: movieCover,
            step2_gradeImage: gradeImage,
            step2_movieTitle: movieTitle,
            step2_screeningTheater: screeningTheater,
            step2_screeningDate: screeningDate,
            step2_screeningTime: screeningTime
        }));
    
        // AJAX 요청
        $.ajax({
            url: '/admin/step3', // 서버의 URL
            type: 'GET',
            data: {
                selectedSeats: selectedSeats,
                adultCount: adultCount,
                minorCount: minorCount,
                elderlyCount: elderlyCount,
                disabledCount: disabledCount,
                movieCover: movieCover,
                gradeImage: gradeImage,
                movieTitle: movieTitle,
                screeningTheater: screeningTheater,
                screeningDate: screeningDate,
                screeningTime: screeningTime
            },
            success: function(response) {
                console.log("AJAX 요청 성공:", response); // 성공 로그 추가
                // 응답을 받은 후, step3 페이지로 이동
                window.location.href = 'step3?selectedSeats=' + encodeURIComponent(selectedSeats) +
                '&adultCount=' + adultCount + 
                '&minorCount=' + minorCount + 
                '&elderlyCount=' + elderlyCount + 
                '&disabledCount=' + disabledCount +
                '&movieCover=' + encodeURIComponent(movieCover) + 
                '&gradeImage=' + encodeURIComponent(gradeImage) + 
                '&movieTitle=' + encodeURIComponent(movieTitle) + 
                '&screeningTheater=' + encodeURIComponent(screeningTheater) + 
                '&screeningDate=' + encodeURIComponent(screeningDate) + 
                '&screeningTime=' + encodeURIComponent(screeningTime); // 페이지 이동 시 파라미터 추가
            },
            error: function(xhr, status, error) {
                console.error('AJAX 요청 오류:', status, error); // 오류 로그 추가
                alert('오류가 발생했습니다: 로그인 후 이용해주세요' + error);
            },
            complete: function() {
                isRequestInProgress = false; // 요청 완료 상태로 변경
            }
        }); // AJAX 요청 끝
    }); // 클릭 이벤트 핸들러 끝
}); // document.ready 끝
</script>

<style type="text/css">
.movie-cover{
   width: 70px;
   height: auto;
}

.movie-grade-img {
   width: 35px;
   height:auto;
   padding-left: 10px;
}

.movie-title {
   text-align: left;
   font-size: 25px;
}

.screening-date {
   padding-left: 10px;
}

.text-sub {
   padding: 10px;
}

.screening-time{

}

.screening-theater {

}

<!---->

.table1-container {
   display: inline-block;
   vertical-align: top;
   margin-right: 20px;
}

.flex-container {
    display: flex; /* Flexbox 사용 */
    justify-content: center; /* 공간을 고르게 배치 */
    margin-top: 20px; /* 위쪽 여백 추가 (필요에 따라 조정) */
}

.table2-container {
   margin-left: 60px;
}

<!---->

.input_number_whole{
    width: 100px;
    height: 50px;
    display: flex;
}
.shopping_number{
    width: 200px;
    height: 32px;
    outline: none;
}
.shopping_number input{
    width: 32px;
    height: 32px;
    text-align: center;
    font-size: 20px;
    margin: 0!important;
    text-decoration: none;
    padding: 0!important;
    outline: none;
}
.number_minus{
    width: 32px;
    height: 36px;
    background-color: #C8D7FF	;
    color: #000000;
    font-size: 30px;
    border: none;
    outline: none!important;
    cursor: pointer;
}
.number_plus{
    width: 32px;
    height: 36px;
    background-color: #C8D7FF	;
    color: #000000;
    font-size: 30px;
    border: none;
    outline: none!important;
    cursor: pointer;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

<!---->

.table1-background {
   background-color: #F4F4F4;
}

<!---->

#txtPeopleCheck {

color: #f4f4f4;
}
#txtMaxCheck{
text-align: right;
color: #f4f4f4;
}

#txtSeatCheck{
color: #f4f4f4;
}

#screen {
letter-spacing: 15px;
font-size: 30px;
background-color: gray;
}


#txtTheater{
color: #f4f4f4;
}


.theater {
   width: 1000px; /* 고정된 너비 */
   height: 700px; /* 고정된 높이 */
   display: inline-block;
   margin: 20px;
   border: 1px solid #ccc;
   padding: 10px;
}
.seat {
    width: 70px;
    height: 70px;
    margin: 5px;
    display: inline-block;
    background-color: #eee;
    cursor: pointer;
    font-size: 25px;
}

.selected {
    background-color: #6c757d;
}
.reserved {
    background-color: #dc3545;
    cursor: not-allowed;
}

<!---->

.table2-container table th {
    background-color: #FFD1B7;
    width: 100px;
}

.table2-container table td {
    background-color: #FFFF96;
    width: 200px;
}

#background{
   background-color: #000000;
}

#nextButton {
 border: 1px;
 background-color: #AECDFF;
 cursor: pointer;
 border-radius: 5px;
 font-size: 20px;
}
/* 사이드바 */
.sideba{
   position:absolute;
   width: 90px;
   font-size: 13px;
}
#first{
   background-color: #FFD1B7;
   padding: 116% 0;
   color: white;
}
#second{
   background-color: #90AFFF;
   padding: 116% 0;
}
#third{
   background-color: #D2FFD2;
   padding: 116% 0;
   color: white;
}
#fourth{
   background-color: #FFFF96;
   padding: 116% 0;
   color: white;
}

</style>
<!--
.table-container {
   display: flex;
   flex-direction: row;
   margin-bottom: 20px;
}
-->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 사이드바 -->
<aside class="sideba">
<div class= 'container'> 
  <section id= 'first'>
    <h1>1. 상영시간</h1>
  </section>
  
  <section id= 'second'>
    <h1>2. 인원/좌석</h1>
  </section>
  
 <section id= 'third'>
   <h1>3. 예매정보확인</h1>
  </section>
  
 <section id= 'fourth'>
   <h1>4. 예매완료</h1>
  </section>
</div>
</aside>
<!--  -->
<div id="background">

<div>
   <h3 id="txtPeopleCheck">인원/좌석 선택</h3>
   <p><h4 id="txtMaxCheck">*인원은 최대1명까지 선택 가능합니다.</h4></p>
</div>

<form method="get">


<div class="table1-background"><!-- 영역시작 -->
<!-------------------------- 인원수 버튼 시작 ------------------------------->
   <div class="table1-container">
      <table>
         <tr>
            <td rowspan="2">
               <img src="./image2/${mItem.moviecover}" class="movie-cover">
            </td>
            
            <td colspan="12">
               <span class="movie-grade"><img src="./image/${mItem.gradeimage}" alt="영화 등급 이미지" class="movie-grade-img" align="left"></span>
               <span class="movie-title">${mItem.movietitle}</span>
            </td>
         </tr>
         <tr>
            <td>
               <span class="screening-date">${sItem.screening_date}</span><span class="text-sub">|</span>
               <span class="screening-time">${sItem.screening_time}</span><br>
               <span class="screening-theater">${sItem.screening_theater}</span>
            </td>
         </tr>
      </table>
   </div>
<!--  -->   
   <div class="table1-container">
      <table>
         <tr>
            <td>성인</td>
            <td>
                <div class="input_number_whole">
                    <div class="number_btn">
                        <button class="number_minus" type="button">-</button>
                    </div>
                    <div class="shopping_number">
                        <input type="number" name="adultCount" class="txt" id="txt" value="0" onchange="this.value = Math.floor(Math.max(this.value,1))" readonly/>
                    </div>
                    <div class="number_btn">
                        <button class="number_plus" type="button">+</button>
                    </div>
                </div>      
            </td>
            
            <td>청소년</td>
            <td>
                <div class="input_number_whole">
                    <div class="number_btn">
                        <button class="number_minus" type="button">-</button>
                    </div>
                    <div class="shopping_number">
                        <input type="number" name="minorCount" class="txt" id="txt" value="0" onchange="this.value = Math.floor(Math.max(this.value,1))" readonly/>
                    </div>
                    <div class="number_btn">
                        <button class="number_plus" type="button">+</button>
                    </div>
                </div>      
            </td>
            
            <td>경로</td>
            <td>
                <div class="input_number_whole">
                    <div class="number_btn">
                        <button class="number_minus" type="button">-</button>
                    </div>
                    <div class="shopping_number">
                        <input type="number" name="elderlyCount" class="txt" id="txt" value="0" onchange="this.value = Math.floor(Math.max(this.value,1))" readonly/>
                    </div>
                    <div class="number_btn">
                        <button class="number_plus" type="button">+</button>
                    </div>
                </div>      
            </td>
            
            <td>장애인</td>
            <td>
                <div class="input_number_whole">
                    <div class="number_btn">
                        <button class="number_minus" type="button">-</button>
                    </div>
                    <div class="shopping_number">
                        <input type="number" name="disabledCount" class="txt" id="txt" value="0" onchange="this.value = Math.floor(Math.max(this.value,1))" readonly/>
                    </div>
                    <div class="number_btn">
                        <button class="number_plus" type="button">+</button>
                    </div>
                </div>      
            </td>                           
         </tr>   
      </table>
   </div>
<!-------------------------- 인원수 버튼 끝 ------------------------------->
</div><!-- 영역끝 -->



  
</form>

<!-------------------------- 좌석 ------------------------------->

<h4 id="txtSeatCheck">*좌석 선택 후 예매하기 버튼을 클릭하세요</h4>
<div id="screen">
   <span>SCREEN</span>
</div>


<div class="flex-container"> <!-- 새 부모 div 추가 -->

   <div class="theater">
      <h2 id="txtTheater">상영관 1</h2>
      <div id="seats">
          <!-- 좌석을 동적으로 생성 -->
      </div>
   </div>
      

<!-------------------------- 좌석 script ------------------------------->
<script type="text/javascript">

//$(document).ready(function(){
    const totalRows = 7; // 총 행 수
    const seatsPerRow = 10; // 각 행의 좌석 수
    const reservedSeats = []; // 예약된 좌석 (예시)
    const seatsContainer = $('#seats');

    // 좌석 생성
    for (let row = 0; row < totalRows; row++) {
       const rowDiv = $('<div><div>'); // 각 행을 위한 div생성
        for(let seatIndex = 0; seatIndex < seatsPerRow; seatIndex++){
            const seat = $('<div class="seat"></div>');
            const seatNumber = String.fromCharCode(65 + row) + (seatIndex + 1);
            seat.data('index', seatNumber);
            seat.text(seatNumber);

            // 예약된 좌석 처리
            if (reservedSeats.includes(seatNumber)) {
                seat.addClass('reserved');
                seat.attr('title', '예약된 좌석');
                seat.css('cursor', 'not-allowed');
            }

            // 좌석 클릭 이벤트
            seat.click(function() {
                const isSelected = $(this).hasClass('selected');
                const selectedCount = $('.selected').length;

                // 선택된 인원 수 계산
                const maxCount = parseInt($("input[name='adultCount']").val()) +
                                 parseInt($("input[name='minorCount']").val()) +
                                 parseInt($("input[name='elderlyCount']").val()) +
                                 parseInt($("input[name='disabledCount']").val()); // 선택된 인원 수

                // 인원 수에 따라 좌석 선택 제한
                if (maxCount == 0) {
                   alert('인원을 선택해주세요.');
                   return;
                }
                else if (!isSelected && selectedCount >= maxCount) {
                    alert('선택 가능한 인원을 초과했습니다.');
                    return;
                }
                              
                // 좌석 선택/해제 처리
                $(this).toggleClass('selected');
                updateSelectedSeats();
                updateMaxSelectableSeats();
            });

            rowDiv.append(seat); //좌석을 행에 추가
        }
        seatsContainer.append(rowDiv); //행을 좌석 컨테이너에 추가
    }

    // 선택된 좌석 업데이트
    function updateSelectedSeats() {
        const selectedSeats = $('.selected').map(function() {
            return $(this).data('index');
        }).get();
        $('#selectedSeats').text(selectedSeats.join(', '));
    }
//});
    
    
</script>

<!-------------------------- 인원수 집계 시작 ------------------------------->
   <div class="table2-container">
      <table width="300px" height="600px">
           <tr>
              <th colspan="2">
                 인원수
              </th>
           </tr>
         <tr>
            <th>성인</th>
            <td id="total-Adult"></td>
         </tr>
         <tr>
            <th>청소년</th>
            <td id="total-Minor"></td>
         </tr>
         <tr>
            <th>경로</th>
            <td id="total-Elderly"></td> <!-- Senior -->
         </tr>
         <tr>
            <th>장애인</th>
            <td id="total-Disabled"></td>
         </tr>
         <tr>
            <th>선택된 좌석</th>
            <td id="selectedSeats"></td>
         </tr>     
           <tr>
              <th colspan="2">
                 <input type="button" id="nextButton" value="다음"> <!--  onclick="location.href='step3'" -->
              </th>
           </tr> 
      </table>
   </div>   
<!-------------------------- 인원수 집계 끝 ------------------------------->
</div><!-- flex-container 영역 끝 -->



</div>
</body>
</html>