resource "google_compute_instance" "my_vm" {
  name         = var.instance_name
  machine_type = var.instance_type
  zone         = var.zone


  tags = ["jenkins", "sonarqube"]


  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20230516"
    }
  }

  network_interface {
    network       = google_compute_network.vpc.name
    subnetwork    = google_compute_subnetwork.network_subnet.name
    access_config {
      // External IP
    }
  }

  metadata = {
    startup-script = <<-EOF
      #! /bin/bash
      sudo apt-get update
      sudo apt install git -y
      sudo apt install -y openjdk-17-jre wget vim

      # Install Jenkins
      curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
      echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
      sudo apt-get update
      sudo apt-get install jenkins -y
      sudo systemctl start jenkins
      sudo systemctl enable jenkins



      #install sonar

     # Home directory for sonar user
      sudo mkdir -p /home/sonar

      cd /opt/
      wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.6.1.59531.zip
      sudo unzip sonarqube-9.6.1.59531.zip
      sudo useradd --shell /bin/bash sonar
      chown sonar:sonar /opt/sonarqube-9.6.1.59531 -R
      chmod 777 /opt/ sonarqube-9.6.1.59531 -R
      su - sonar

      #run this on server manually
      cd /opt/sonarqube-9.6.1.59531/bin/linux-x86-64/
      sh sonar.sh start
      sh sonar.sh status

      #echo "user=admin & password=admin"


      # Install required dependencies
      sudo apt-get install -y curl tar openjdk-17-jdk
      # Set Tomcat version
      TOMCAT_VERSION=11.0.2
      # Download and extract Tomcat
      curl -O https://dlcdn.apache.org/tomcat/tomcat-11/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz
      tar -zxvf apache-tomcat-${TOMCAT_VERSION}.tar.gz
      # Move Tomcat to a standard directory
      sudo mv apache-tomcat-${TOMCAT_VERSION} /usr/local/tomcat
      # Set permissions
      sudo chmod +x /usr/local/tomcat/bin/*.sh
     sudo  /usr/local/tomcat/bin/catalina.sh stop
      # Configure Tomcat users for manager access
      sudo sed -i '56 a\<role rolename="manager-gui"/>' /usr/local/tomcat/conf/tomcat-users.xml
      sudo sed -i '57 a\<role rolename="manager-script"/>' /usr/local/tomcat/conf/tomcat-users.xml
      sudo sed -i '58 a\<user username="tomcat" password="tomcat" roles="manager-gui, manager-script"/>' /usr/local/tomcat/conf/tomcat-users.xml
      sudo sed -i 's/port="8080"/port="8081"/' /usr/local/tomcat/conf/server.xml
# Optional: Remove default restrictive access in the manager app (not recommended for production)
      sudo sed -i '/<\/Context>/i <!-- -->' /usr/local/tomcat/webapps/manager/META-INF/context.xml
      # Start Tomcat

       EOF
  }
}


output "instance_ip" {
  value = google_compute_instance.my_vm.network_interface[0].access_config[0].nat_ip
}
