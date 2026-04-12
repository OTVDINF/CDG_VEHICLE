for dir in /home/otavio/images/*; do 
    name=$(basename "$dir") 
    mkdir -p "/home/otavio/output_crops3/$name"

    for img in "$dir"/*.{jpg,jpeg,png}; do 
        [ -e "$img" ] || continue

        yolo predict model=yolov8m.pt device=0 source="$img" save_crop=True save=False classes=2,3,5,7 project=/home/otavio/tmp_yolo name=temp exist_ok=True >/dev/null 2>&1

        crop=$(find /home/otavio/tmp_yolo/temp/crops -type f 2>/dev/null | head -n 1)

        if [ -f "$crop" ]; then
            new_name=$(basename "$img")
            cp "$crop" "/home/otavio/output_crops3/$name/$new_name"
        fi

        rm -rf /home/otavio/tmp_yolo/temp

    done
done
