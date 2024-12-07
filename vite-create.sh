# following line tells bash should interpret this file. Make this file execuatble by: chmod +x viteclean.sh 
#!/bin/bash

# read -prompted projectName from user
read -p "Prject name: " projectName;

# create a react project using vite@6.0.0
echo "🧾: create react project";
npm create vite@6.0.0 "$projectName" -- --template react -y;

# remove boilerplate and create a clean structure
echo "🧾: remove boilerplate";
cd "$projectName";
rm -rv public/ src/ index.html;
mkdir -v client/ client/assets/ client/src/ client/src/pages/ client/src/components/ client/src/styles/ server/ server/src/;
touch client/index.html client/src/main.jsx client/src/components/App.jsx client/src/styles/main.css server/index.js;

# initialize npm in client side
echo "🧾: npm install in client side";
mv package.json eslint.config.js client/;
cd client/;
npm pkg set name=$projectName-client
npm install;
cd ..;

# initialize npm in server side
echo "🧾: npm init in server side";
cd server/;
npm init -y;
npm pkg set name=$projectName-server
npm pkg set type="module";
cd ..;
