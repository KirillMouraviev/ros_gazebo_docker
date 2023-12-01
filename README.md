# ros_gazebo_docker

Docker-контейнер для тестирования ROS-узлов навигации робота в симуляторе Gazebo.

## Сборка

1. Склонировать репозиторий:
   
   `git clone https://github.com/KirillMouraviev/ros_gazebo_docker`
   
3. Собрать Docker-образ:

   `cd ros_gazebo_docker`
   
   `./build.sh`
   
5. Создать контейнер и войти в него:
   
   `./run.sh`

## Запуск
1. Запустить уже созданный контейнер и войти в него:

   `docker start ros_gazebo_docker`
   
   `docker attach ros_gazebo_docker`
   
2. Запустить [tmux](https://habr.com/ru/articles/327630/) (утилита для разделения терминала на несколько окон и запуска задач в фоновом режиме):
   
   `tmux`
   
3. В первом окне tmux запустить симуляцию робота и полигона в Gazebo:
   
   `roslaunch turtlebot3_gazebo turtlebot3_world.launch`
   
4. Во втором окне tmux запустить публикацию состояния робота:
   
   `rosrun robot_state_publisher robot_state_publisher`
   
5. В третьем окне tmux запустить SLAM с помощью метода [GMapping](https://wiki.ros.org/gmapping):
    
   `roslaunch turtlebot3_slam turtlebot3_gmapping.launch`

6. В четвертом окне tmux запустить rviz:
    
   `rviz`
   
7. И в пятом окне tmux запустить написанный ROS-узел планирования пути.
