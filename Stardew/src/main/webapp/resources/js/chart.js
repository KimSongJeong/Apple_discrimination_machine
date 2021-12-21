// Chart의 font.옵션 설정
Chart.defaults.font.family = 'Jal_Haru';

// 차트를 생성하는 함수
function makeChart(id,fig){
    const ctx = document.getElementById(id).getContext('2d');
    const cfg = fig;
    new Chart(ctx,cfg);
}

//실시간 X축 시간 만들기
let timeXLabel = [];
let today = new Date();
function addHour(){
	var nowHour = today.getHours();
	
	for(let i=0; i<=nowHour; i++){
		let whatHour = i+'시';
		timeXLabel.push(whatHour);
	}
}
addHour();
console.log(`X축이 될 내용은 ${timeXLabel} 입니다.`);

//데이터 테이블의 값 가져오기 위함
let Arr = [];

let oh = document.getElementsByClassName('listItem')[0].childNodes[0].nodeValue;
let song = document.getElementsByClassName('listItem')[1].childNodes[0].nodeValue;
let gwan = document.getElementsByClassName('listItem')[2].childNodes[0].nodeValue;
let young = document.getElementsByClassName('listItem')[3].childNodes[0].nodeValue;
let stardew = document.getElementsByClassName('listItem')[4].childNodes[0].nodeValue;

Arr.push(oh);
Arr.push(song);
Arr.push(gwan);
Arr.push(young);
Arr.push(stardew);

// 데이터셋 

let typeA = {
    label: '타입A', //차트 제목
    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
    data: Arr,
    backgroundColor: ['rgba(74, 94, 206, 1)',//양품
    				'rgba(54, 8, 7, 1)', //흑점
    				'rgba(141, 22, 17, 1)', //멍
    				'rgba(235, 97, 92, 1)', //열과
    				'rgba(255, 182, 103, 1)'//기타
    ],
    borderColor: ['rgba(74, 94, 206, 1)',
    				'rgba(54, 8, 7, 1)',
    				'rgba(141, 22, 17, 1)',
    				'rgba(235, 97, 92, 1)',
    				'rgba(255, 182, 103, 1)'
    ],
    borderWidth: 2 //경계선 굵기
};



// context와 config의 기본 형태
// datasets가 미리 생성되어야 한다.
//let context = document.getElementById('minichart1').getContext('2d');
let config = {
        type: 'doughnut', // 차트의 형태
        data: { // 차트에 들어갈 데이터
            labels: [
                //x 축
                '양품', '흑점','멍', '열과', '기타'
            ],
            datasets: [typeA]
        },
        options: {
            animation: {
                duration : 1000
            },
            scales: {
                yAxes: [
                    {
                        ticks: {
                            beginAtZero: true
                        }
                    }
                ],
                x: {
                    title: {
                        color: 'black',
                        display: true,
                        text : '총 데이터 분류 결과'
                    }
                }
            }
        }
};

// 차트 생성하기
var minichart1 = makeChart('minichart1', config);