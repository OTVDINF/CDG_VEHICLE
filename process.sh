mkdir -p /home/otavio/LPLCv2_crop2

yolo predict model=yolov8m.pt device=0 \
    source=/home/otavio/LPLCv2_completa/LPLCv2/images \
    save_crop=True save=False classes=2,3,5,7 \
    project=/home/otavio/tmp_yolo name=fast exist_ok=True

find /home/otavio/tmp_yolo/fast/crops -type f -exec cp {} /home/otavio/LPLCv2_crop2/ \;crops4/$name/$new_name"

            ((i++))
        done

        
        rm -rf /home/otavio/tmp_yolo/temp
    done
done


