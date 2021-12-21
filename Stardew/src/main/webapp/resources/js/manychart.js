let empty = "";
let active = "나는 active였어";
let small = "나는 avtive가 될거야";


empty = active;
active = small;
small = empty;
empty ="";

console.log(`지금 빈공간 위한 변수는 ${empty}가 들어가있고
active에 있는 값은 ${active}이고
small에 있는 값은${small}이다.`)

// Chart의 font.옵션 설정
Chart.defaults.font.family = 'Jal_Haru';
Chart.defaults.elements.point.radius = 0;

// 차트를 생성하는 함수
function makeChart(id,fig){
    const ctx = document.getElementById(id).getContext('2d');
    const cfg = fig;
    new Chart(ctx,cfg);
}

//실시간 x축 시간 만들기
let timeXLabel = [];
let today = new Date();
function addHour(){
    var nowHour = today.getHours();

    for(let i=4; i<= nowHour; i++){
        let iWantVariable = i+'시';
        timeXLabel.push(iWantVariable);
        // console.log(iWantVariable);
    }
}
addHour();
console.log(`시간이 추가된 배열인가? ${timeXLabel}`); //ㅇㅋㅇㅋ됐음
let dataArr1=[0,5,10,5,2,];
let dataArr2=[];
let dataArr3=[];

for(let i=0; i<=timeXLabel.length; i++){
    dataArr1.push( Math.floor(Math.random()*20));
    dataArr2.push( Math.floor(Math.random()*20));
    dataArr3.push( Math.floor(Math.random()*20));

}

///////////////////////실시간으로 만들어진거 담는 배열 짱많아/////////////

let kind = '';
let timefuji = [];
let timeYang = [];
let tempArrF = [];
let tempArrY = [];
let tempArrFF = [];
let tempArrYY = [];
let dotfuji = [];
let dotYang = [];
let datafuji = [];
let dataYang = [];
let dataGold = [];

let limit = document.getElementsByClassName('listlength')[0].childNodes[0].nodeValue;
//테이블 값 가지고 와서 시간 배열, 불량률 다음 배열 생성
for(let i=0; i<limit; i++){
    kind = document.getElementsByClassName('liveKind')[i].childNodes[0].nodeValue;

    if(kind == 'fuji'){
        let rawTime = document.getElementsByClassName('liveTime')[i].childNodes[0].nodeValue;
        let HourTime = rawTime.substr(11);
        tempArrF[i] = Number(HourTime);

        let rawRatio = document.getElementsByClassName('ratio')[i].childNodes[0].nodeValue;
        tempArrFF[i] = 100 - Number(rawRatio);

    }else{
        let rawTime = document.getElementsByClassName('liveTime')[i].childNodes[0].nodeValue;
        let HourTime = rawTime.substr(11);
        tempArrY[i] = Number(HourTime);

        let rawRatio = document.getElementsByClassName('ratio')[i].childNodes[0].nodeValue;
        tempArrYY[i] = 100 - Number(rawRatio);
        
    }
}
//2번째 품종은 배열의 공백을 없애준다.
tempArrY = tempArrY.filter(function(item) {
    return item !== null && item !== undefined && item !== '';
  });
//시간 받아오기
for(let j=0; j<24; j++){
    timefuji[tempArrF[j]] = tempArrF[j];
    timeYang[tempArrY[j]] = tempArrY[j];
}
tempArrYY = tempArrYY.filter(function(item) {
    return item !== null && item !== undefined && item !== '';
  });
//null값 채우기
for(let k=0; k<24; k++){
    if(timefuji[k] == null){
        timefuji[k] = 0;
    }
}
for(let k=0; k<24; k++){
    if(timeYang[k] == null){
        timeYang[k] = 0;
    }
}
for(let q=0; q<24; q++){
    dotfuji.push(timefuji[q]);
    dotYang.push(timeYang[q]);
}
for(let itbe=23; itbe>0; itbe--){
    if(dotfuji[itbe] != 0){
        dotfuji[itbe] = (tempArrFF.splice(-1))[0];
    }
}

for(let itbe=23; itbe>0; itbe--){
    if(dotYang[itbe] != 0){
        dotYang[itbe] = (tempArrYY.splice(-1))[0];
    }
}
//////////////////// 여기까지가 시간 배열 ///////////////////////

console.log(dotfuji);
console.log(dotYang);

for(let i=0; i<dotfuji.length; i++){
	datafuji.push(dotfuji[i]);
}

for(let i=0; i<dotYang.length; i++){
	dataYang.push(dotYang[i]);
}

//console.log(datafuji);
//console.log(dataYang);

// 데이터셋 A,B,C
let typeA = {
    label: '사과-부사-선별기 1', //차트 제목
    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
    data: [0,0,1,2,20,30,23,13,12,10,20,13,12,12],
    backgroundColor: ['rgba(255, 99, 132, 1)'//색상
    ],
    borderColor: ['rgba(255, 99, 132, 1)'//경계선 색상
    ],
    borderWidth: 2,//경계선 굵기
    tension : 0.2 
};

let typeB = {
    label: '사과-부사-선별기 2',
    fill: false,
    data: [0,0,1,3,12,23,12,11,9,10,23,22,12,8],
    backgroundColor: 'rgba(54, 162, 235, 1)',
    borderColor: 'rgba(54, 162, 235, 1)',
    borderWidth: 2,
    tension : 0.2
};

let typeC = {
    label: '사과-부사-선별기 3',
    fill: false,
    data:  [0,0,1,2,2,3,3,12,13,34,27,20,17,15],
    backgroundColor: 'rgba(183, 225, 112, 1)',
    borderColor: 'rgba(183, 225, 112, 1)',
    borderWidth: 2,
    tension : 0.2
};


//그래프 2번째 시간마다 쌓은 것

let typeD = {
    label: '사과-fuji', //차트 제목
    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
    data: dotfuji,
    backgroundColor: ['rgba(255, 99, 132, 1)'//색상
    ],
    borderColor: ['rgba(255, 99, 132, 1)'//경계선 색상
    ],
    borderWidth: 2,//경계선 굵기
    tension : 0.2 
};


let typeE = {
    label: '사과-양광',
    fill: false,
    data: dotYang,
    backgroundColor: 'rgba(54, 162, 235, 1)',
    borderColor: 'rgba(54, 162, 235, 1)',
    borderWidth: 2,
    tension : 0.2
};

let typeE2 = {
    label: '사과-장성 황금사과',
    fill: false,
    data: [0,0,1,2,2,3,3,12,13,34,27,20,17,15],
    backgroundColor: 'rgba(183, 225, 112, 1)',
    borderColor: 'rgba(183, 225, 112, 1)',
    borderWidth: 2,
    tension : 0.2
};

let oh = document.getElementsByClassName('dayday')[0].childNodes[0].nodeValue;
let song = document.getElementsByClassName('dayday')[1].childNodes[0].nodeValue;
let gwan = document.getElementsByClassName('dayday')[2].childNodes[0].nodeValue;
let young = document.getElementsByClassName('dayday')[3].childNodes[0].nodeValue;
let stardew = document.getElementsByClassName('dayday')[4].childNodes[0].nodeValue;

let Arr = [];
Arr.push(oh);
Arr.push(song);
Arr.push(gwan);
Arr.push(young);
Arr.push(stardew);

let typeF = {
    label: '양품',
    fill: false,
    data: Arr,
    backgroundColor: ['rgba(74, 94, 206, 1)',
    				'rgba(54, 8, 7, 1)',
    				'rgba(141, 22, 17, 1)',
    				'rgba(235, 97, 92, 1)',
    				'rgba(255, 182, 103, 1)'],
    borderColor: ['rgba(74, 94, 206, 1)',
    				'rgba(54, 8, 7, 1)',
    				'rgba(141, 22, 17, 1)',
    				'rgba(235, 97, 92, 1)',
    				'rgba(255, 182, 103, 1)'],
    borderWidth: 2
};

//분류결과 타입 G,H,I,J,K,ItsYou
let normal = [];
normal.push(document.getElementsByClassName('ItsYou')[2].childNodes[0].nodeValue);
normal.push(document.getElementsByClassName('ItsYou')[5].childNodes[0].nodeValue);
normal.push(1300);

let black = [];
black.push(document.getElementsByClassName('ItsYou')[3].childNodes[0].nodeValue);
black.push(document.getElementsByClassName('ItsYou')[9].childNodes[0].nodeValue);
black.push(100);
console.log(`흑점${black}`);

let contusion = [];
contusion.push(document.getElementsByClassName('ItsYou')[0].childNodes[0].nodeValue);
contusion.push(document.getElementsByClassName('ItsYou')[7].childNodes[0].nodeValue);
contusion.push(80);
console.log(`멍입니다요${contusion}`);

let crack = [];
crack.push(document.getElementsByClassName('ItsYou')[4].childNodes[0].nodeValue);
crack.push(document.getElementsByClassName('ItsYou')[8].childNodes[0].nodeValue);
crack.push(150);
console.log(`지금은 열과 ${crack}`);

let etc = [];
etc.push(document.getElementsByClassName('ItsYou')[1].childNodes[0].nodeValue);
etc.push(document.getElementsByClassName('ItsYou')[6].childNodes[0].nodeValue);
etc.push(154);
console.log(`지금은 열과 ${etc}`);

let typeG = {
    label: '양품',
    fill: false,
    data: normal,
    backgroundColor: ['rgba(74, 94, 206, 1)'],
    borderColor: ['rgba(74, 94, 206, 1)'],
    borderWidth: 2
};

let typeH = {
    label: '흑점',
    fill: false,
    data: black,
    backgroundColor: ['rgba(54, 8, 7, 1)'],
    borderColor: ['rgba(54, 8, 7, 1)'],
    borderWidth: 2
};

let typeI = {
    label: '멍',
    fill: false,
    data: contusion,
    backgroundColor: ['rgba(141, 22, 17, 1)'],
    borderColor: ['rgba(141, 22, 17, 1)'],
    borderWidth: 2
};

let typeJ = {
    label: '열과',
    fill: false,
    data: crack,
    backgroundColor: ['rgba(235, 97, 92, 1)'],
    borderColor: ['rgba(235, 97, 92, 1)'],
    borderWidth: 2
};

let typeK = {
    label: '기타',
    fill: false,
    data: etc,
    backgroundColor: ['rgba(255, 182, 103, 1)'],
    borderColor: ['rgba(255, 182, 103, 1)'],
    borderWidth: 2
};



// 차트종류 바꾸기
let chartType = 'line';


// context와 config의 기본 형태
// datasets가 미리 생성되어야 한다.
//let context = document.getElementById('myChart').getContext('2d');
let config = {
        type: chartType, // 차트의 형태
        data: { // 차트에 들어갈 데이터
            labels: timeXLabel,
            datasets: [typeA, typeB]
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
                        text : '차트 제목입니다.'
                    }
                }
            }
        }
};



//let context2 = document.getElementById('myChart2').getContext('2d');
//선별기별 실시간
let config2 = {
    type: chartType, // 차트의 형태
    data: { // 차트에 들어갈 데이터
        labels: timeXLabel,
        datasets: [typeA, typeB, typeC]
    },
    options: {
        animation: {
            duration : 1000
        },
        scales: {
            yAxes: [
                {
                    ticks: {
                        beginAtZero: true,
                        min: 0,
                        stepSize: 10,
                        max: 100,
                        fontSize:14
                    }
                }
            ],
            x: {
                title: {
                    color: 'black',
                    display: true,
                    text : '선별기별 실시간 그래프'
                }
            }
        }
    }
};

//품종별 실시간
let config3 = {
    type: chartType, // 차트의 형태
    data: { // 차트에 들어갈 데이터
        labels: timeXLabel,
        datasets: [typeD, typeE, typeE2]
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
                    text : '품종별 실시간 그래프'
                }
            }
        }
    }
};

//기간별 데이터 분류 결과
let config4 = {
    type: 'doughnut', // 차트의 형태
    data: { // 차트에 들어갈 데이터
        labels: ['양품', '흑점','멍', '열과', '기타'],
        datasets: [typeF]
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
                    text : '기간별 데이터 분류결과'
                }
            }
        }
    }
};

let config5 = {
    type: 'bar', // 차트의 형태
    data: { // 차트에 들어갈 데이터
        labels: ['사과 fuji', '사과 양광', '사과 황금사과'],
        datasets: [typeG, typeH, typeI, typeJ, typeK]
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
            xAxes: {
                title: {
                    color: 'black',
                    display: true,
                    text : '품종별 결과'
                },
                barPercentage:0.2
            }
        }
    }
};


// 차트 생성하기
//var myChart = makeChart('myChart',config);
// var chartKind = makeChart('chartKind',config2);
let chartDevice = makeChart('chartDevice',config3);
let chartDayby01 = makeChart('chartDayby01',config4);
let chartDaybyList = makeChart('chartDaybyList',config5);

//$('.cropdate').on('apply.daterangepicker', function(start, end){
//    console.log($('.cropdate').val());
//    let dateText = $('.cropdate').val();
//    startDay = dateText.substr(0,10);
//    endDay = dateText.substr(13);
//
//    $('.dateTextStart').val(startDay);
//    $('.dateTextEnd').val(endDay);
//    console.log($('.dateTextStart').val());
//    console.log($('.dateTextEnd').val());
//
//
//});