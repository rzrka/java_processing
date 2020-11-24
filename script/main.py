import numpy as np
import cv2
import datetime
import math


def get_d(my_list):
    min_x = min(my_list)
    max_x = max(my_list)
    d = max_x-min_x
    return d

def get_speed(start, end, d):
    try:
        if end == 0:
            raise
        length = d*math.pi
        t = end - start
        v = length / t
        return str(v*0.02636)
    except:
        return '0'

def time_end(x):
    time = int(x.replace(tzinfo=datetime.timezone.utc).timestamp())
    return time



check_end = 1
list_x = []
color_yellow = (0,255,255)

time_start = datetime.datetime.now()
start_time = int(time_start.replace(tzinfo=datetime.timezone.utc).timestamp())
end_time = 0
speed = 0

cap = cv2.VideoCapture('./video/test.flv')
#cap = cv2.VideoCapture(0)#запись с вэбки
#green
hsv_min = np.array((53, 55, 147), np.uint8)
hsv_max = np.array((83, 160, 255), np.uint8)

#hsv_min = np.array((0, 0, 100), np.uint8)
#hsv_max = np.array((0, 0, 200), np.uint8)
while True:
    flag, img = cap.read()
    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    thresh = cv2.inRange(hsv, hsv_min, hsv_max)

    moments = cv2.moments(thresh, 1)
    dM01 = moments['m01']
    dM10 = moments['m10']
    dArea = moments['m00']

    if dArea > 100:
        x = int(dM10 / dArea)
        y = int(dM01 / dArea)
        cv2.circle(img, (x, y), 10, (0, 0, 255), -1)
        print(x)
        list_x.append(x)
        cv2.putText(img, "%d-%d" % (x, y), (x, y),
                    cv2.FONT_HERSHEY_SIMPLEX, 1, color_yellow, 2)
        start_time = int(time_start.replace(tzinfo=datetime.timezone.utc).timestamp())
        if x == 642:
            check_end += 1
            if check_end == 2:
                time_end = datetime.datetime.now()
                end_time = int(time_end.replace(tzinfo=datetime.timezone.utc).timestamp())
        if check_end == 2:
            speed = get_speed(start=start_time, end=end_time, d=get_d(list_x))
            check_end = 0
            time_start = datetime.datetime.now()
        cv2.putText(img, str(speed), (100, 100), cv2.FONT_HERSHEY_SIMPLEX, 1, color_yellow, 2)

    cv2.imshow('Video', img)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()