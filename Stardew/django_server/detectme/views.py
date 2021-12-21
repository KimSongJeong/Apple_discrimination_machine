from datetime import datetime
import cv2
import numpy as np
from django.shortcuts import render
from django.views.decorators import gzip
from django.http import HttpResponse, StreamingHttpResponse, JsonResponse
import threading
import json
import pymysql
from datetime import datetime
import os


# home
def home(request):
    return render(request, 'home.html')

# # 스프링에서 데이터 받아오기
def on(request):
    if request.method == 'POST':
        global mb_id
        global m_id
        global deep_id
        global fruit_kind
        global stt
        mb_id = request.POST['mb_id']
        m_id = request.POST['m_id']
        deep_id = request.POST['deep_id']
        fruit_kind = request.POST['fruit_kind']
        stt = request.POST['stt']
        print(mb_id, m_id, deep_id, fruit_kind, stt)
        return mb_id, m_id, deep_id, fruit_kind, stt

# def self_on(self):
#     if self.method == 'POST':
#         mb_id = self.POST['mb_id']
#         m_id = self.POST['m_id']
#         deep_id = self.POST['deep_id']
#         fruit_kind = self.POST['fruit_kind']
#         stt = self.POST['stt']
#         print(mb_id, m_id, deep_id, fruit_kind, stt)
#         return mb_id, m_id, deep_id, fruit_kind, stt



# 스프링에서 쿼리스트링으로 받아오기
# def home(request):
#     num = request.GET['test']
#     num = int(num)
#     if num == 1:
#         return render(request, 'start')
#     elif num == 2:
#         return render(request, '2home.html')


classes = ["acceptance", "defect"]
classes1 = ["contusion", "crack", "blackDot", "stalk"]

boxes = []
indexes1 = [] 
boxes1 = []
class_ids1 = [] 
check1 =[]
height= []
# DB_data = ''


# ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


# 양품/불량품 분류 모델
def yolo(frame, size, score_threshold, nms_threshold):
    class_name = 0
    class_list = []
    # YOLO 파일 불러오기
    net = cv2.dnn.readNet("C:/Users/smhrd/Django/hoaeng/yolov4-ap2_last.weights",
                            "C:/Users/smhrd/Django/hoaeng/yolov4-ap2.cfg")
    layer_names = net.getLayerNames()
    output_layers = [layer_names[i[0] - 1] for i in net.getUnconnectedOutLayers()]

    # 클래스의 갯수만큼 RGB 배열을 생성
    # 양품 파랑, 불량품 빨강
    colors = [[255,0,0],[0,0,255]] 
    
    # 이미지의 높이, 너비, 채널 받아오기
    height, width, channels = frame.shape
    total_median = [width/2,height/2] # 이미지의 중앙값 좌표

    # 네트워크에 넣기 위한 전처리
    blob = cv2.dnn.blobFromImage(frame, 0.00392, (size, size), (0, 0, 0), True, crop=False)

    # 전처리된 blob 네트워크에 입력
    net.setInput(blob)

    # 결과 받아오기
    outs = net.forward(output_layers)

    # 각각의 데이터를 저장할 빈 리스트
    class_ids = []
    confidences = []
    global boxes
    boxes = []

    for out in outs:
        for detection in out:
            scores = detection[5:]
            class_id = np.argmax(scores)
            confidence = scores[class_id]

            if confidence > 0.1:
                # 탐지된 객체의 너비, 높이 및 중앙 좌표값 찾기
                center_x = int(detection[0] * width)
                center_y = int(detection[1] * height)
                w = int(detection[2] * width)
                h = int(detection[3] * height)

                # 객체의 사각형 테두리 중 좌상단 좌표값 찾기
                x = int(center_x - w / 2)
                y = int(center_y - h / 2)

                boxes.append([x, y, w, h])
                confidences.append(float(confidence))
                class_ids.append(class_id)

    # 후보 박스(x, y, width, height)와 confidence(상자가 물체일 확률) 출력
    print(f"boxes: {boxes}")
    print(f"confidences: {confidences}")

    # Non Maximum Suppression (겹쳐있는 박스 중 confidence 가 가장 높은 박스를 선택)
    indexes = cv2.dnn.NMSBoxes(boxes, confidences, score_threshold=score_threshold, nms_threshold=nms_threshold)
    
    # 후보 박스 중 선택된 박스의 인덱스 출력
    print(f"indexes: ", end='')
    for index in indexes:
        print(index, end=' ')
    print("\n\n============================== classes ==============================")

    for i in range(len(boxes)):
        if i in indexes:
            x, y, w, h = boxes[i]
            class_name = classes[class_ids[i]]
            class_list.append(class_name)
            label = f"{class_name} {confidences[i]:.2f}"
            color = colors[class_ids[i]]

            # 사각형 테두리 그리기 및 텍스트 쓰기
            cv2.rectangle(frame, (x, y), (x + w, y + h), color, 2)
            cv2.rectangle(frame, (x - 1, y), (x + len(class_name) * 13 + 65, y - 25), color, -1)
            cv2.putText(frame, label, (x, y - 8), cv2.FONT_HERSHEY_COMPLEX_SMALL, 1, (0, 0, 0), 2)
            
            # 탐지된 객체의 정보 출력
            print(f"[{class_name}({i})] conf: {confidences[i]} / x: {x} / y: {y} / width: {w} / height: {h}")


    return frame, class_list, boxes, indexes, total_median, class_ids



# ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ




# 증상별 분류 모델
def yolo_obj(frame, size, score_threshold, nms_threshold):
    class_name = 0
    class_list = []
    # YOLO 네트워크 불러오기
    net = cv2.dnn.readNet("C:/Users/smhrd/Django/hoaeng/yolov4-4obj-416_last.weights", 
                            "C:/Users/smhrd/Django/hoaeng/yolov4-4obj-416.cfg")
    layer_names = net.getLayerNames()
    output_layers = [layer_names[i[0] - 1] for i in net.getUnconnectedOutLayers()]

    # 클래스의 갯수만큼 랜덤 RGB 배열을 생성
    colors = [[255,255,255],[255,255,255],[255,255,255], [255,255,255]]

    # 이미지의 높이, 너비, 채널 받아오기
    height, width, channels = frame.shape

    # 네트워크에 넣기 위한 전처리
    blob = cv2.dnn.blobFromImage(frame, 0.00392, (size, size), (0, 0, 0), True, crop=False)

    # 전처리된 blob 네트워크에 입력
    net.setInput(blob)

    # 결과 받아오기
    outs = net.forward(output_layers)

    # 각각의 데이터를 저장할 빈 리스트
    class_ids = []
    confidences = []
    boxes = []

    for out in outs:
        for detection in out:
            scores = detection[5:]
            class_id = np.argmax(scores)
            confidence = scores[class_id]

            if confidence > 0.1:
                # 탐지된 객체의 너비, 높이 및 중앙 좌표값 찾기
                center_x = int(detection[0] * width)
                center_y = int(detection[1] * height)
                w = int(detection[2] * width)
                h = int(detection[3] * height)

                # 객체의 사각형 테두리 중 좌상단 좌표값 찾기
                x = int(center_x - w / 2)
                y = int(center_y - h / 2)

                boxes.append([x, y, w, h])
                confidences.append(float(confidence))
                class_ids.append(class_id)

    # 후보 박스(x, y, width, height)와 confidence(상자가 물체일 확률) 출력
    print(f"boxes: {boxes}")
    print(f"confidences: {confidences}")

    # Non Maximum Suppression (겹쳐있는 박스 중 confidence 가 가장 높은 박스를 선택)
    indexes = cv2.dnn.NMSBoxes(boxes, confidences, score_threshold=score_threshold, nms_threshold=nms_threshold)
    
    # 후보 박스 중 선택된 박스의 인덱스 출력
    print(f"indexes: ", end='')
    for index in indexes:
        print(index, end=' ')
    print("\n\n============================== classes ==============================")

    for i in range(len(boxes)):
        if i in indexes:
            x, y, w, h = boxes[i]
            class_name = classes1[class_ids[i]] ######## classes를 classes1로 바꾸기
            class_list.append(class_name)
            label = f"{class_name} {confidences[i]:.2f}"
            color = colors[class_ids[i]]

            # 사각형 테두리 그리기 및 텍스트 쓰기
            cv2.rectangle(frame, (x, y), (x + w, y + h), color, 2)
            cv2.rectangle(frame, (x - 1, y), (x + len(class_name) * 13 + 65, y - 25), color, -1)
            cv2.putText(frame, label, (x, y - 8), cv2.FONT_HERSHEY_COMPLEX_SMALL, 1, (0, 0, 0), 2)
            
            # 탐지된 객체의 정보 출력
            print(f"[{class_name}({i})] conf: {confidences[i]} / x: {x} / y: {y} / width: {w} / height: {h}")


    return frame,class_list ,boxes, indexes ,class_ids




# ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ




# 검출된 여러 객체 중 DB에 저장될 객체정보 추출하는 함수
def find_obj(indexes1,  boxes1, class_ids1, check):
    global boxes
    X,Y,W,H = boxes[check[0]] # 불량사과의 박스 범위
    result_list=[] 
    for idx1 in indexes1 : # 불량사과 안에 있는 불량 요소 객체
        X1,Y1,W1,H1 = boxes1[idx1[0]]
        if X <=X1 and Y<=Y1 and (X+W)>=(X1+W1) and (Y+H)>=(Y1+H1):
            print('객체를 찾았다@@@@@@@@@@@@@@@@@@@@@@@@@@@')
            result_list.append(classes1[class_ids1[idx1[0]]])
            
    return result_list



def find_nearest(total_median, indexes, boxes, class_ids):
    result_list = []
    nearest = 99999999
    if len(indexes) > 0 :
        for idx in indexes :
            x,y,w,h = boxes[idx[0]]
            if abs(total_median[0]-((x+w)/2))+ abs(total_median[1]-((x+w+y+h)/2)) <= nearest:
                nearest = abs(total_median[0]-((x+w)/2))+ abs(total_median[1]-((x+w+y+h)/2))
                check = idx
        print('■■■■■■■■중앙에 가장 가까운 객체 check : ',check)
        result_data = classes[class_ids[check[0]]]
        print('■■■■■■■■■중앙에 가까운 객체의 라벨 데이터', result_data)
        if result_data == 'acceptance':
            result_list.append(result_data)
        else : # 만약 중앙에 가까운 객체의 라벨 데이터가 불량품일 경우
            result_list= find_obj(indexes1,  boxes1, class_ids1, check)
        if len(result_list) ==0 :
            result_list.append('etc')
    
    return result_list




# ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ



# DB에 데이터 저장 함수
# m_seq,fruit_kind, deep_seq,mb_id 값을 웹으로부터 받아오기.
# DB_data = 'defect'
# m_id = 1
# fruit_kind = 'fugi'
# deep_id = 1
# mb_id = 'test'


def insert(fruit_kind, deep_id, DB_data, mb_id, m_id):
    conn = pymysql.connect(host='project-db-stu.ddns.net',
                            port=3307,
                            user='stardew',
                            password='village',
                            db='cig_3_3_1022',
                            charset='utf8')
    try:
        curs = conn.cursor()
        sql = "insert into classifications(fruit_kind,deep_id,cl_result,mb_id,m_id) values(%s,%s,%s,%s,%s)"
        # val = (1,'fugi',1,'acceptance','test')
        val = (fruit_kind, deep_id, DB_data, mb_id,m_id)
        curs.execute(sql, val)
        conn.commit()
    finally:
        conn.close()


# ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

def insert_path(img_path, file_name, mb_id, m_id):
    conn = pymysql.connect(host='project-db-stu.ddns.net',
                           port = 3307,
                      user='stardew',
                      password='village',
                       db= 'cig_3_3_1022',
                      charset='utf8')
    try:
        curs=conn.cursor()
        sql = "insert into ai_data(img_path, file_name, mb_id, m_id) values (%s,%s,%s,%s)"
        val = (img_path, file_name, mb_id, m_id)
        curs.execute(sql,val)
        conn.commit()
    finally:
        conn.close()

def createFolder(directory): # 일단 이미지 저장 파일 만들기
    try:
        if not os.path.exists(directory):
            os.makedirs(directory)
    except OSError:
        print('creating directory' + directory)

# ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
# 이미지 전처리
def image_sharp(frame):
    kernel = np.array([[0, -1, 0],
                    [-1, 5, -1],
                   [0, -1, 0]])
    sharp = cv2.filter2D(frame, -1, kernel)
    return sharp

# ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


class VideoCamera(object):

    def __init__(self):
        self.video = cv2.VideoCapture(0)
        (self.grabbed, self.frame) = self.video.read()
        threading.Thread(target=self.update, args=()).start()
        self.num=1
        self.DB_list = []

    def __del__(self):
        self.video.release()
        DB_list = []  # 8프레임동안 검출된 객체들의 모임
        result_list = []  # 1프레임안에 검출된 객체들의 list
        num = 1  # 프레임수 카운트 하는것

    
    

    def get_frame(self):
        # stt = ""
        # if self.method == 'POST':
        #     on(self)


        if stt != "off":
            # if self.method == 'POST':
            #     mb_id = self.POST['mb_id']
            #     m_id = self.POST['m_id']
            #     deep_id = self.POST['deep_id']
            #     fruit_kind = self.POST['fruit_kind']
            #     print(mb_id, m_id, deep_id, fruit_kind)
            size_list = [500, 500, 608]
            image = self.frame
            pre_frame = image_sharp(image)

            # # 욜로코드 실행
            frame, class_list,boxes, indexes, total_median,class_ids= yolo(frame=pre_frame, size=size_list[2], score_threshold=0.4, nms_threshold=0.4)
            frame1, class_list1,boxes1,indexes1,class_ids1 = yolo_obj(frame=pre_frame, size=size_list[2], score_threshold=0.4, nms_threshold=0.4)

            # 이미지 저장
            result_list=find_nearest(total_median, indexes, boxes, class_ids)
            if 'acceptance' not in result_list and len(result_list)!=0:
                print('여기가 실행이 되는건가요!!!!!!!!!!!!!!!!!!!!!!!!@@@@@@@@@@@@@@@@@@@@@@@')
                cv2.imwrite(f"{datetime.now().strftime('%Y%m%d%H%M%S')}.jpg",frame1)
                img_path = os.getcwd() + '\data'
                createFolder(img_path) # 현재경로에 data 디렉토리가 없으면 생성해라~
                file_name = '{}.jpg'.format(datetime.now().strftime('%Y%m%d%H%M%S'))
                insert_path(img_path, file_name, mb_id, m_id)

            self.DB_list += result_list

            # 시간/날짜 기재
            # height1=frame.shape[0]
            cv2.putText(frame, f"{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}" , (0,frame.shape[0]-3 ), cv2.FONT_HERSHEY_COMPLEX_SMALL, 0.8, (0, 0, 0), 1)
            if len(result_list)!= 0 and self.num <= 8 :
                self.DB_list = self.DB_list+ result_list # 8프레임동안의 객체검출 결과를 DB_list에 저장
                result_list = []
                print(self.num ,'번 프레임입니다.') #프레임제한
                self.num += 1
            elif self.num > 8 :
                print('다른 사과입니다.여기서 한번 db에 결과를 넣어야 합니다')
                # 8프레임동안 들어간 중복값들 제거
                self.DB_list = list(set(self.DB_list))
                if 'acceptance' in self.DB_list :
                    self.DB_list.remove('acceptance')
                if 'stalk' in self.DB_list :
                    self.DB_list.remove('stalk')
                # 8프레임동안 양품만 들어있었다면 양품
                if len(self.DB_list) == 0:
                    DB_data = 'acceptance'
                # 그게 아니라면 불량품
                # else :
                    # DB_data = ','.join(list(set(self.DB_list)))
                if len(self.DB_list)>0 :
                    for i in self.DB_list:
                        DB_data = i
                        insert(fruit_kind, deep_id, DB_data, mb_id, m_id)
                # on()
                # m_id = 10
                # fruit_kind = 'fugi'
                # deep_id  = 1
                # mb_id = 'test'
                insert(fruit_kind, deep_id, DB_data, mb_id, m_id)
                #print('DB_data!!!!!!!!!!!!!!!!!!!!',DB_data)
            # DB에 결과값 널기
            # 스프링에서 받아온 기기 아이디, 회원아이디, 딥러닝 아이디, 사과 종류를 가져오는 함수 on을 호출
            # 위에서 얻은 DB_data와 함께 DB에 INSERT
            # on()
            # DB_data = 'acceptance'

                self.num = 1 # 프레임 리셋하기
                self.DB_list = [] ## DB 리스트 리셋하기

            _, jpeg = cv2.imencode('.jpg', pre_frame)
            return jpeg.tobytes()
        else :
            return quit()




    def update(self):
        while True:
            (self.grabbed, self.frame) = self.video.read()


def gen(camera):
    while True:
        frame = camera.get_frame()
        yield(b'--frame\r\n'
            b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n\r\n')



@gzip.gzip_page
def streaming(request):
    try:
        if request.method == 'POST':
            on(request)
            # stt = request.POST['stt']
        cam = VideoCamera()
        return StreamingHttpResponse(gen(cam), content_type="multipart/x-mixed-replace;boundary=frame")
        # elif stt == "off" :
        #     exit(VideoCamera())
    except:  # This is bad! replace it with proper handling
        print("에러입니다...")
        pass


