;; 良さげな位置のメモ
#f(120.029 -15.0455 89.9919 -0.048779 -119.956 -0.004107)

(send *ri* :angle-vector-raw (send *kinova* :angle-vector #f(-150.029 -15.0455 60.9919 -100.048779 -100.956 -0.004107)) 5000)

(send *ri* :angle-vector-raw (send *kinova* :angle-vector #f(-149.075 -17.0383 51.0735 -90.482 -108.916 -0.540145)) 5000)

(send *ri* :angle-vector-raw (send *kinova* :arm :move-end-pos #f(-140 0 0)))

